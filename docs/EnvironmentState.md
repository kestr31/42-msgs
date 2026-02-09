# EnvironmentState

Environment vectors resolved in the spacecraft body frame.

## 42 Source

`SC[i].svb`, `SC[i].bvb`, `SC[i].Hvb`

## Definition

```
builtin_interfaces/Time stamp
float64[3] svb   # Sun vector in body frame [unit vector]
float64[3] bvb   # Magnetic field in body frame [Tesla]
float64[3] hvb   # Total angular momentum in body frame [Nms]
```

## Fields

| Field | Type | Unit | Description |
|-------|------|------|-------------|
| `stamp` | `builtin_interfaces/Time` | | ROS2 timestamp |
| `svb` | `float64[3]` | | Unit vector from SC toward Sun, expressed in **B** frame |
| `bvb` | `float64[3]` | T | Magnetic field vector, expressed in **B** frame |
| `hvb` | `float64[3]` | Nms | Total angular momentum (rigid bodies + wheels), expressed in **B** frame |
