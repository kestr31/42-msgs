# WheelState

Reaction wheel angular momentum for all wheels on the spacecraft.

## 42 Source

`SC[i].Whl[k].H`

## Definition

```
builtin_interfaces/Time stamp
float64[] h   # Wheel angular momentum [Nms] for each wheel
```

## Fields

| Field | Type | Unit | Description |
|-------|------|------|-------------|
| `stamp` | `builtin_interfaces/Time` | | ROS2 timestamp |
| `h` | `float64[]` | Nms | Angular momentum for each wheel. Array length equals number of wheels (`Nw`) |
