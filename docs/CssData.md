# CssData

Single coarse sun sensor (CSS) reading. Used as an element of `CssArray`.

## 42 Source

`SC[i].CSS[k]`

## Definition

```
bool    valid
float64 illum   # Illumination level
```

## Fields

| Field | Type | Unit | Description |
|-------|------|------|-------------|
| `valid` | `bool` | | Whether the sensor has a valid reading (sun in FOV) |
| `illum` | `float64` | | Illumination level (0.0 = no sun, 1.0 = full illumination) |
