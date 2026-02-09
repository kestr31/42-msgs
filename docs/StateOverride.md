# StateOverride

Full state override message sent to 42 via the RX channel. Each field has a corresponding `_valid` flag; only fields with their flag set to `true` are transmitted.

## 42 Source

RX variables: `SC[i].qn`, `SC[i].wn`, `SC[i].PosR`, `SC[i].VelR`, `SC[i].svb`, `SC[i].bvb`, `SC[i].Hvb`, `SC[i].Whl[k].H`, `SC[i].G[k].Pos`

## Definition

```
builtin_interfaces/Time stamp

bool       qn_valid
float64[4] qn            # Attitude quaternion [x, y, z, scalar]

bool       wn_valid
float64[3] wn            # Angular velocity [rad/s]

bool       pos_r_valid
float64[3] pos_r         # Position relative to reference orbit [m]

bool       vel_r_valid
float64[3] vel_r         # Velocity relative to reference orbit [m/s]

bool       svb_valid
float64[3] svb           # Sun vector in body frame

bool       bvb_valid
float64[3] bvb           # Magnetic field in body frame [Tesla]

bool       hvb_valid
float64[3] hvb           # Total angular momentum in body frame [Nms]

bool       whl_h_valid
float64[]  whl_h         # Wheel angular momentum [Nms]

bool       joint_pos_valid
float64[]  joint_pos     # Joint positions (flattened [Ng x 3])
```

## Fields

| Field | Type | Unit | Description |
|-------|------|------|-------------|
| `stamp` | `builtin_interfaces/Time` | | ROS2 timestamp |
| `qn_valid` | `bool` | | Enable quaternion override |
| `qn` | `float64[4]` | | Attitude quaternion `[x, y, z, scalar]` |
| `wn_valid` | `bool` | | Enable angular velocity override |
| `wn` | `float64[3]` | rad/s | Angular velocity |
| `pos_r_valid` | `bool` | | Enable relative position override |
| `pos_r` | `float64[3]` | m | Position relative to reference orbit |
| `vel_r_valid` | `bool` | | Enable relative velocity override |
| `vel_r` | `float64[3]` | m/s | Velocity relative to reference orbit |
| `svb_valid` | `bool` | | Enable sun vector override |
| `svb` | `float64[3]` | | Sun vector in body frame |
| `bvb_valid` | `bool` | | Enable magnetic field override |
| `bvb` | `float64[3]` | T | Magnetic field in body frame |
| `hvb_valid` | `bool` | | Enable angular momentum override |
| `hvb` | `float64[3]` | Nms | Total angular momentum in body frame |
| `whl_h_valid` | `bool` | | Enable wheel momentum override |
| `whl_h` | `float64[]` | Nms | Wheel angular momentum per wheel |
| `joint_pos_valid` | `bool` | | Enable joint position override |
| `joint_pos` | `float64[]` | m | Joint positions, flattened `[Ng x 3]` |

## Notes

This is a selective override mechanism. Only fields with `*_valid = true` are serialized into the RX message sent to 42. This allows overriding individual state variables without affecting others.
