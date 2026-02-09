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
| `illum` | `float64` | | Illumination level, proportional to cosine of angle between sun direction and sensor normal (defined by mounting geometry in **B** frame). Range 0.0 -- 1.0 |
