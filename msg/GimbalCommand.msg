# Per-gimbal joint commands for all joints (length AC->Ng each).
# Arrays are flattened [Ng x N], matching JointState42 layout.
# Empty arrays indicate no gimbals on this spacecraft.
float64[] qrl_flat        # [Ng x 4] quaternion (lifted) [x,y,z,scalar]
float64[] qrn_flat        # [Ng x 4] quaternion (Newtonian) [x,y,z,scalar]
float64[] ang_rate_flat   # [Ng x 3] [rad/s]
float64[] ang_flat        # [Ng x 3] [rad]
float64[] pos_rate_flat   # [Ng x 3] [m/s]
float64[] pos_flat        # [Ng x 3] [m]
