# WheelCommand

Reaction wheel torque commands.

**Status:** Available via `StateOverride.whl_tcmd` (text IPC). Also defined as standalone message for future direct-command support.

## 42 Source

`AC.Whl[k].Tcmd`

## Definition

```
builtin_interfaces/Time stamp
float64[] tcmd   # Wheel torque command [Nm] for each wheel
```

## Fields

| Field | Type | Unit | Description |
|-------|------|------|-------------|
| `stamp` | `builtin_interfaces/Time` | | ROS2 timestamp |
| `tcmd` | `float64[]` | Nm | Torque command per wheel, along each wheel's spin axis (axis defined by mounting geometry in **B** frame). Array length = `Nw` |
