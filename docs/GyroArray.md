# GyroArray

True angular rate from all gyroscope axes on the spacecraft.

## 42 Source

`SC[i].Gyro[k].TrueRate`

## Definition

```
builtin_interfaces/Time stamp
float64[] true_rate   # True angular rate [rad/s] per gyro axis
```

## Fields

| Field | Type | Unit | Description |
|-------|------|------|-------------|
| `stamp` | `builtin_interfaces/Time` | | ROS2 timestamp |
| `true_rate` | `float64[]` | rad/s | True angular rate per gyro axis. Array length equals number of gyros (`Ngyro`) |
