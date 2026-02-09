# ThrusterCommand

Thruster pulse width commands.

**Status:** Future (requires AcIPC binary protocol).

## 42 Source

`Thr[k]`

## Definition

```
builtin_interfaces/Time stamp
float64[] pulse_width   # Thruster pulse width [s] for each thruster
```

## Fields

| Field | Type | Unit | Description |
|-------|------|------|-------------|
| `stamp` | `builtin_interfaces/Time` | | ROS2 timestamp |
| `pulse_width` | `float64[]` | s | Pulse width command for each thruster. Array length equals number of thrusters (`Nthr`) |
