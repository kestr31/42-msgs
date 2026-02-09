# JointState42

Joint positions, rates, angles, and angle rates for all joints on the spacecraft.

## 42 Source

`SC[i].G[k]` (position, position rate, angle, angle rate per 3-DOF joint)

## Definition

```
builtin_interfaces/Time stamp
uint32   num_joints
float64[] pos        # Flattened [Ng x 3]: joint positions
float64[] pos_rate   # Flattened [Ng x 3]: joint position rates
float64[] ang        # Flattened [Ng x 3]: joint angles [rad]
float64[] ang_rate   # Flattened [Ng x 3]: joint angle rates [rad/s]
```

## Fields

| Field | Type | Unit | Description |
|-------|------|------|-------------|
| `stamp` | `builtin_interfaces/Time` | | ROS2 timestamp |
| `num_joints` | `uint32` | | Number of joints (`Ng = Nb - 1`) |
| `pos` | `float64[]` | m | Joint translational displacements along joint DOF axes. Flattened `[Ng x 3]` |
| `pos_rate` | `float64[]` | m/s | Joint translational rates along joint DOF axes. Flattened `[Ng x 3]` |
| `ang` | `float64[]` | rad | Joint Euler angles about gimbal axes. Flattened `[Ng x 3]` |
| `ang_rate` | `float64[]` | rad/s | Joint Euler angle rates about gimbal axes. Flattened `[Ng x 3]` |

## Notes

Each joint has 3 DOF. For joint `k`, the 3 components are at indices `[3*k]`, `[3*k+1]`, `[3*k+2]`.
