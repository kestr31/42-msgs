# FssArray

Array of all fine sun sensor (FSS) readings on the spacecraft.

## 42 Source

`SC[i].FSS[k]` for all `k`

## Definition

```
builtin_interfaces/Time stamp
sim42_msgs/FssData[] sensors
```

## Fields

| Field | Type | Description |
|-------|------|-------------|
| `stamp` | `builtin_interfaces/Time` | ROS2 timestamp |
| `sensors` | `FssData[]` | Array of per-sensor readings. Length equals number of FSS units (`Nfss`) |

## See Also

- [FssData](FssData.md) -- per-sensor element type
