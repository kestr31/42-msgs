# SC-level attitude/position reference setpoints (single per spacecraft).
# These are the FSW guidance-layer outputs; 42 may use them in
# MapCmdsToActuators or ignore them for pure-plant configs.
float64[4] qrl           # Reference quaternion (lifted) [x, y, z, scalar]
float64[4] qrn           # Reference quaternion (Newtonian) [x, y, z, scalar]
float64[3] ang_rate      # [rad/s]
float64[3] ang           # [rad]
float64[3] pos_rate      # [m/s]
float64[3] pos           # [m]
