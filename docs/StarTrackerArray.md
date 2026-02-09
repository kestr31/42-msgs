# StarTrackerArray

Array of all star tracker readings on the spacecraft.

## 42 Source

`SC[i].ST[k]` for all `k`

## Definition

```
builtin_interfaces/Time stamp
sim42_msgs/StarTrackerData[] trackers
```

## Fields

| Field | Type | Description |
|-------|------|-------------|
| `stamp` | `builtin_interfaces/Time` | ROS2 timestamp |
| `trackers` | `StarTrackerData[]` | Array of per-tracker readings. Length equals number of star trackers (`Nst`) |

## See Also

- [StarTrackerData](StarTrackerData.md) -- per-tracker element type
