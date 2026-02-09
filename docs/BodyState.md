# BodyState

Angular velocity and quaternion for all rigid bodies on the spacecraft.

## 42 Source

`SC[i].B[k].wn`, `SC[i].B[k].qn`

## Definition

```
builtin_interfaces/Time stamp
uint32   num_bodies
float64[] wn   # Flattened [Nb x 3]: angular velocity per body [rad/s]
float64[] qn   # Flattened [Nb x 4]: quaternion per body [x, y, z, scalar]
```

## Fields

| Field | Type | Unit | Description |
|-------|------|------|-------------|
| `stamp` | `builtin_interfaces/Time` | | ROS2 timestamp |
| `num_bodies` | `uint32` | | Number of rigid bodies (`Nb`) |
| `wn` | `float64[]` | rad/s | Angular velocity of each body w.r.t. **N**, expressed in that body's own **B** frame. Flattened `[Nb x 3]` |
| `qn` | `float64[]` | | Quaternion: rotation from **N** to each body's **B** frame. `[x, y, z, scalar]`, flattened `[Nb x 4]` |

## Notes

For body `k`: angular velocity is at `wn[3*k .. 3*k+2]`, quaternion is at `qn[4*k .. 4*k+3]`.
