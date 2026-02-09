# AttitudeState

Spacecraft attitude quaternion and angular velocity.

## 42 Source

`SC[i].qn`, `SC[i].wn`

## Definition

```
builtin_interfaces/Time stamp
float64[4] qn     # Attitude quaternion [x, y, z, scalar]
float64[3] wn     # Angular velocity [rad/s] in body frame
```

## Fields

| Field | Type | Unit | Description |
|-------|------|------|-------------|
| `stamp` | `builtin_interfaces/Time` | | ROS2 timestamp |
| `qn` | `float64[4]` | | Attitude quaternion: rotation from inertial **N** to body **B** frame. Convention: `[x, y, z, scalar]` |
| `wn` | `float64[3]` | rad/s | Angular velocity of **B** w.r.t. **N**, expressed in **B** frame |
