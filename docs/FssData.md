# FssData

Single fine sun sensor (FSS) reading. Used as an element of `FssArray`.

## 42 Source

`SC[i].FSS[k]`

## Definition

```
bool       valid
float64[2] sun_ang   # Sun angles [rad]: horizontal, vertical
```

## Fields

| Field | Type | Unit | Description |
|-------|------|------|-------------|
| `valid` | `bool` | | Whether the sensor has a valid reading (sun in FOV) |
| `sun_ang` | `float64[2]` | rad | Sun angles `[horizontal, vertical]` in the sensor frame |
