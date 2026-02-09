# MagArray

Magnetic field readings from all magnetometer axes on the spacecraft.

## 42 Source

`SC[i].MAG[k].Field`

## Definition

```
builtin_interfaces/Time stamp
float64[] field   # Magnetic field [Tesla] per magnetometer axis
```

## Fields

| Field | Type | Unit | Description |
|-------|------|------|-------------|
| `stamp` | `builtin_interfaces/Time` | | ROS2 timestamp |
| `field` | `float64[]` | T | Projection of magnetic field vector (in **B** frame) onto each magnetometer's measurement axis (axis defined by mounting geometry in **B** frame). Array length = `Nmag` |
