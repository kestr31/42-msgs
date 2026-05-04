#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.10"
# ///
"""Doxygen input filter: converts ROS2 .msg/.srv files to pseudo-C++ structs."""

import re
import sys
from pathlib import Path

TYPE_MAP: dict[str, str] = {
    "bool": "bool",
    "int8": "int8_t",
    "uint8": "uint8_t",
    "int16": "int16_t",
    "uint16": "uint16_t",
    "int32": "int32_t",
    "uint32": "uint32_t",
    "int64": "int64_t",
    "uint64": "uint64_t",
    "float32": "float",
    "float64": "double",
    "string": "std::string",
    "byte": "uint8_t",
    "char": "char",
}

GROUP_MAP: dict[str, str] = {
    "SimTime": "telemetry_time",
    "AttitudeState": "telemetry_state",
    "OrbitalState": "telemetry_state",
    "EnvironmentState": "telemetry_state",
    "BodyState": "telemetry_state",
    "GyroArray": "telemetry_sensors",
    "MagArray": "telemetry_sensors",
    "AccelArray": "telemetry_sensors",
    "CssArray": "telemetry_sensors",
    "CssData": "telemetry_sensors",
    "FssArray": "telemetry_sensors",
    "FssData": "telemetry_sensors",
    "StarTrackerArray": "telemetry_sensors",
    "StarTrackerData": "telemetry_sensors",
    "GpsState": "telemetry_sensors",
    "JointState42": "telemetry_joints",
    "WheelState": "telemetry_actuators",
    "StateOverride": "commands",
    "JointCommand": "commands",
    "ThrusterCommand": "commands",
    "FswDone": "commands",
    "BridgeStatus": "diagnostics",
    "GetSimStatus": "services",
    "SetSimState": "services",
    "ResetConnection": "services",
}

FIELD_RE = re.compile(
    r"^([\w/]+)(\[(\d*)\])?\s+(\w+)\s*(#\s*(.*))?$"
)

CONST_RE = re.compile(
    r"^(\w+)\s+(\w+)\s*=\s*(.+?)(\s*#\s*(.*))?$"
)


def map_type(ros_type: str, bracket: str | None, size: str | None) -> str:
    if "/" in ros_type:
        parts = ros_type.split("/")
        cpp = f"{parts[0]}::msg::{parts[1]}"
    else:
        cpp = TYPE_MAP.get(ros_type, ros_type)

    if bracket is not None:
        if size:
            return f"std::array<{cpp}, {size}>"
        else:
            return f"std::vector<{cpp}>"
    return cpp


def format_comment_block(lines: list[str]) -> str:
    if not lines:
        return ""
    out = ["/**"]
    first = True
    for line in lines:
        stripped = line.strip()
        if first and stripped:
            out.append(f" * @brief {stripped}")
            first = False
        elif first and not stripped:
            continue
        elif stripped:
            if first:
                out.append(f" * @brief {stripped}")
                first = False
            else:
                out.append(f" * {stripped}")
        else:
            out.append(" *")
    out.append(" */")
    return "\n".join(out)


def format_field_comment(lines: list[str]) -> str:
    if not lines:
        return ""
    out = ["    /**"]
    for line in lines:
        stripped = line.strip()
        if stripped:
            out.append(f"     * {stripped}")
        else:
            out.append("     *")
    out.append("     */")
    return "\n".join(out)


def convert_msg(filepath: Path, struct_name: str, namespace: str) -> str:
    lines = filepath.read_text().splitlines()
    group = GROUP_MAP.get(struct_name, "")

    is_srv = filepath.suffix == ".srv"
    if is_srv:
        return convert_srv(lines, struct_name, group)

    return convert_struct(lines, struct_name, namespace, group)


def convert_struct(
    lines: list[str],
    struct_name: str,
    namespace: str,
    group: str,
    extra_brief: str = "",
    wrap_namespace: bool = True,
) -> str:
    out: list[str] = []
    pending_comments: list[str] = []
    struct_comment_lines: list[str] = []
    fields_started = False

    for line in lines:
        stripped = line.strip()

        if not stripped:
            if not fields_started:
                if pending_comments:
                    struct_comment_lines.extend(pending_comments)
                    struct_comment_lines.append("")
                    pending_comments = []
            else:
                if pending_comments:
                    out.append(format_field_comment(pending_comments))
                    pending_comments = []
                out.append("")
            continue

        if stripped.startswith("#"):
            comment_text = stripped[1:].lstrip() if len(stripped) > 1 else ""
            pending_comments.append(comment_text)
            continue

        if stripped == "---":
            continue

        const_m = CONST_RE.match(stripped)
        if const_m:
            if not fields_started:
                struct_comment_lines.extend(pending_comments)
                pending_comments = []
                fields_started = True

            ros_type = const_m.group(1)
            name = const_m.group(2)
            value = const_m.group(3).strip()
            inline_comment = const_m.group(5)
            cpp_type = TYPE_MAP.get(ros_type, ros_type)

            if pending_comments:
                out.append(format_field_comment(pending_comments))
                pending_comments = []

            decl = f"    static constexpr {cpp_type} {name} = {value};"
            if inline_comment:
                decl += f" ///< {inline_comment.strip()}"
            out.append(decl)
            continue

        field_m = FIELD_RE.match(stripped)
        if field_m:
            if not fields_started:
                struct_comment_lines.extend(pending_comments)
                pending_comments = []
                fields_started = True

            ros_type = field_m.group(1)
            bracket = field_m.group(2)
            size = field_m.group(3)
            name = field_m.group(4)
            inline_comment = field_m.group(6)
            cpp_type = map_type(ros_type, bracket, size)

            if pending_comments:
                out.append(format_field_comment(pending_comments))
                pending_comments = []

            decl = f"    {cpp_type} {name};"
            if inline_comment:
                decl += f" ///< {inline_comment.strip()}"
            out.append(decl)
            continue

    struct_doc = format_comment_block(struct_comment_lines)
    if extra_brief and struct_comment_lines:
        struct_doc = struct_doc.replace("@brief ", f"@brief {extra_brief} -- ", 1)
    elif extra_brief:
        struct_doc = f"/** @brief {extra_brief} */"

    if group:
        if struct_doc.endswith(" */"):
            struct_doc = struct_doc[:-3] + f" * @ingroup {group}\n */"
        else:
            struct_doc += f"\n/** @ingroup {group} */"

    result = []
    if wrap_namespace and namespace:
        result.append(f"namespace {namespace} {{")
        result.append("")
    if struct_doc:
        result.append(struct_doc)
    result.append(f"struct {struct_name} {{")
    result.extend(out)
    result.append("};")
    if wrap_namespace and namespace:
        result.append("")
        result.append(f"}} // namespace {namespace}")
    return "\n".join(result)


def convert_srv(lines: list[str], struct_name: str, group: str) -> str:
    request_lines: list[str] = []
    response_lines: list[str] = []
    in_response = False

    header_comments: list[str] = []
    collecting_header = True

    for line in lines:
        stripped = line.strip()
        if stripped == "---":
            in_response = True
            collecting_header = False
            continue
        if collecting_header and stripped.startswith("#"):
            header_comments.append(stripped)
            continue
        elif collecting_header and stripped:
            collecting_header = False

        if in_response:
            response_lines.append(line)
        else:
            request_lines.append(line)

    namespace = "sim42_msgs::srv"
    result = []
    result.append(f"namespace {namespace} {{")
    result.append("")

    header_doc = ""
    if header_comments:
        comment_texts = []
        for h in header_comments:
            text = h[1:].lstrip() if len(h) > 1 else ""
            comment_texts.append(text)
        header_doc = format_comment_block(comment_texts)
        if group:
            header_doc = header_doc[:-3] + f" * @ingroup {group}\n */"

    if header_doc:
        result.append(header_doc)

    has_request_fields = any(
        FIELD_RE.match(l.strip()) or CONST_RE.match(l.strip())
        for l in request_lines
        if l.strip() and not l.strip().startswith("#")
    )

    if not has_request_fields:
        if not header_doc:
            if group:
                result.append(f"/** @brief Request\n * @ingroup {group}\n */")
            else:
                result.append("/** @brief Request */")
        result.append(f"struct {struct_name}_Request {{}};")
    else:
        req_group = "" if header_doc else group
        req_brief = "" if header_doc else "Request"
        req_body = convert_struct(
            request_lines, f"{struct_name}_Request", "", req_group, req_brief,
            wrap_namespace=False,
        )
        result.append(req_body)

    result.append("")

    resp_body = convert_struct(
        response_lines, f"{struct_name}_Response", "", "", "Response",
        wrap_namespace=False,
    )
    result.append(resp_body)

    result.append("")
    result.append(f"}} // namespace {namespace}")
    return "\n".join(result)


def main() -> None:
    if len(sys.argv) < 2:
        print("Usage: msg_filter.py <file.msg|file.srv>", file=sys.stderr)
        sys.exit(1)

    filepath = Path(sys.argv[1])
    stem = filepath.stem
    suffix = filepath.suffix

    if suffix == ".srv":
        namespace = "sim42_msgs::srv"
    else:
        namespace = "sim42_msgs::msg"

    print(f"/** @file {filepath.name} */")
    print()
    print(convert_msg(filepath, stem, namespace))


if __name__ == "__main__":
    main()
