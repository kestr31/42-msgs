# StarTrackerData

Single star tracker reading. Used as an element of `StarTrackerArray`.

## 42 Source

`SC[i].ST[k]`

## Definition

```
bool       valid
float64[4] qn   # Attitude quaternion [x, y, z, scalar]
```

## Fields

| Field | Type | Unit | Description |
|-------|------|------|-------------|
| `valid` | `bool` | | Whether the tracker has a valid solution (not blocked by sun/earth/moon) |
| `qn` | `float64[4]` | | Measured attitude quaternion `[x, y, z, scalar]` |
