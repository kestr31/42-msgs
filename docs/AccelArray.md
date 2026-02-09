# AccelArray

True acceleration from all accelerometer axes on the spacecraft.

## 42 Source

`SC[i].Accel[k].TrueAcc`

## Definition

```
builtin_interfaces/Time stamp
float64[] true_acc   # True acceleration [m/s^2] per accelerometer axis
```

## Fields

| Field | Type | Unit | Description |
|-------|------|------|-------------|
| `stamp` | `builtin_interfaces/Time` | | ROS2 timestamp |
| `true_acc` | `float64[]` | m/s^2 | True acceleration per accelerometer axis. Array length equals number of accelerometers (`Nacc`) |
