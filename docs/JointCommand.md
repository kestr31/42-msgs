# JointCommand

Joint position command sent to 42 via state override.

## 42 Source

`SC[i].G[k].Pos`

## Definition

```
builtin_interfaces/Time stamp
uint32     joint_index
float64[3] pos   # Desired joint position [3-DOF]
```

## Fields

| Field | Type | Unit | Description |
|-------|------|------|-------------|
| `stamp` | `builtin_interfaces/Time` | | ROS2 timestamp |
| `joint_index` | `uint32` | | Index of the target joint (`0` to `Ng-1`) |
| `pos` | `float64[3]` | m | Desired 3-DOF joint translational position along joint DOF axes |
