# GpsState

GPS receiver state including position and velocity in both inertial (N) and ECEF (W) frames.

## 42 Source

`SC[i].GPS[k]`

## Definition

```
builtin_interfaces/Time stamp
bool       valid
int64      rollover    # GPS week rollover counter
int64      week        # GPS week number
float64    sec         # Seconds within GPS week
float64[3] pos_n      # Position in N frame [m]
float64[3] vel_n      # Velocity in N frame [m/s]
float64[3] pos_w      # Position in W (ECEF) frame [m]
float64[3] vel_w      # Velocity in W (ECEF) frame [m/s]
```

## Fields

| Field | Type | Unit | Description |
|-------|------|------|-------------|
| `stamp` | `builtin_interfaces/Time` | | ROS2 timestamp |
| `valid` | `bool` | | Whether the GPS has a valid fix |
| `rollover` | `int64` | | GPS week rollover counter |
| `week` | `int64` | | GPS week number |
| `sec` | `float64` | s | Seconds within the current GPS week |
| `pos_n` | `float64[3]` | m | Position relative to central body center, expressed in inertial **N** frame (includes noise) |
| `vel_n` | `float64[3]` | m/s | Velocity relative to central body center, expressed in inertial **N** frame (includes noise) |
| `pos_w` | `float64[3]` | m | Position relative to central body center, expressed in world-fixed **W** frame (ECEF for Earth; includes noise) |
| `vel_w` | `float64[3]` | m/s | Velocity relative to central body center, expressed in world-fixed **W** frame (ECEF for Earth; includes noise) |
