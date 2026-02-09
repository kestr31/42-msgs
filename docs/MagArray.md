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
| `field` | `float64[]` | T | Magnetic field per magnetometer axis. Array length equals number of magnetometers (`Nmag`) |
