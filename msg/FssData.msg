# Single FSS sensor data
bool valid
# sun_ang [rad]: [horizontal, vertical] angles in the FSS sensor frame.
# H/V/Bore axes are configured per FSS in the SC config; see
# 42/Source/42sensors.c FssModel() for the exact computation
# (atan2(svb[H_Axis], svb[BoreAxis]) and atan2(svb[V_Axis], svb[BoreAxis])).
float64[2] sun_ang
