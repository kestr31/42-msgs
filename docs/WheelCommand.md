# WheelCommand

Reaction wheel torque commands.

**Status:** Future (requires AcIPC binary protocol).

## 42 Source

`Whl[k].Tcmd`

## Definition

```
builtin_interfaces/Time stamp
float64[] tcmd   # Wheel torque command [Nm] for each wheel
```

## Fields

| Field | Type | Unit | Description |
|-------|------|------|-------------|
| `stamp` | `builtin_interfaces/Time` | | ROS2 timestamp |
| `tcmd` | `float64[]` | Nm | Torque command for each wheel. Array length equals number of wheels (`Nw`) |
