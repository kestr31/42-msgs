# OrbitalState

Spacecraft position and velocity: both relative to the reference orbit and the reference orbit itself in the inertial N frame.

## 42 Source

`SC[i].PosR`, `SC[i].VelR`, `Orb[i].PosN`, `Orb[i].VelN`

## Definition

```
builtin_interfaces/Time stamp
float64[3] pos_r    # Position relative to reference orbit [m] in N frame
float64[3] vel_r    # Velocity relative to reference orbit [m/s] in N frame
float64[3] orb_posn # Reference orbit position in N frame [m]
float64[3] orb_veln # Reference orbit velocity in N frame [m/s]
```

## Fields

| Field | Type | Unit | Description |
|-------|------|------|-------------|
| `stamp` | `builtin_interfaces/Time` | | ROS2 timestamp |
| `pos_r` | `float64[3]` | m | Position of SC center of mass relative to reference orbit origin, expressed in **N** frame |
| `vel_r` | `float64[3]` | m/s | Velocity of SC center of mass relative to reference orbit origin, expressed in **N** frame |
| `orb_posn` | `float64[3]` | m | Absolute position of reference orbit origin relative to central body center, expressed in **N** frame |
| `orb_veln` | `float64[3]` | m/s | Absolute velocity of reference orbit origin, expressed in **N** frame |

## Notes

The absolute inertial position of the spacecraft is `orb_posn + pos_r`.
