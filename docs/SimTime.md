# SimTime

Simulation time from the 42 `TIME` line.

## 42 Source

`TIME Year-DOY-HH:MM:SS.sssssssss`

## Definition

```
builtin_interfaces/Time stamp
int64   year
int64   doy        # Day of year
int64   hour
int64   minute
float64 second     # Fractional seconds (up to nanosecond precision)
float64 sim_sec    # Elapsed simulation seconds (computed by bridge)
```

## Fields

| Field | Type | Unit | Description |
|-------|------|------|-------------|
| `stamp` | `builtin_interfaces/Time` | | ROS2 timestamp |
| `year` | `int64` | | Calendar year |
| `doy` | `int64` | | Day of year (1-366) |
| `hour` | `int64` | | Hour (0-23) |
| `minute` | `int64` | | Minute (0-59) |
| `second` | `float64` | s | Fractional seconds |
| `sim_sec` | `float64` | s | Elapsed simulation seconds (computed by bridge from first TIME received) |
