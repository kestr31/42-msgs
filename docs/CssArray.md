# CssArray

Array of all coarse sun sensor (CSS) readings on the spacecraft.

## 42 Source

`SC[i].CSS[k]` for all `k`

## Definition

```
builtin_interfaces/Time stamp
sim42_msgs/CssData[] sensors
```

## Fields

| Field | Type | Description |
|-------|------|-------------|
| `stamp` | `builtin_interfaces/Time` | ROS2 timestamp |
| `sensors` | `CssData[]` | Array of per-sensor readings. Length equals number of CSS units (`Ncss`) |

## See Also

- [CssData](CssData.md) -- per-sensor element type
