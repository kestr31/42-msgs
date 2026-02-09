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
| `qn` | `float64[4]` | | Attitude quaternion of body w.r.t. inertial frame N. Convention: `[x, y, z, scalar]` (matches 42's `[q0, q1, q2, q3]`) |
| `wn` | `float64[3]` | rad/s | Angular velocity of body w.r.t. inertial frame, expressed in body frame |
