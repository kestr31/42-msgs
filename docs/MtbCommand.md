# MtbCommand

Magnetic torque bar (MTB) moment commands.

**Status:** Future (requires AcIPC binary protocol).

## 42 Source

`MTB[k].Mcmd`

## Definition

```
builtin_interfaces/Time stamp
float64[] mcmd   # MTB magnetic moment command [Am^2] for each MTB
```

## Fields

| Field | Type | Unit | Description |
|-------|------|------|-------------|
| `stamp` | `builtin_interfaces/Time` | | ROS2 timestamp |
| `mcmd` | `float64[]` | Am^2 | Magnetic dipole moment per MTB, along each MTB's axis (axis defined by mounting geometry in **B** frame). Array length = `Nmtb` |
