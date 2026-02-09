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
| `true_acc` | `float64[]` | m/s^2 | Projection of non-gravitational acceleration onto each accelerometer's measurement axis (axis defined by mounting geometry in **B** frame). Includes gravity gradient effect at sensor offset from SC center of mass. Array length = `Nacc` |
