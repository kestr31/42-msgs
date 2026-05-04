# Full state override message sent to 42 via RX
# Each field has a corresponding _valid flag; only valid fields are sent
builtin_interfaces/Time stamp

# Monotonic seq from the publisher (0 = unset; older callers omit this).
# The bridge's wait_for_fsw mode pairs this with FswDone.override_seq to
# resolve cross-topic delivery races.
uint64 seq

bool qn_valid
float64[4] qn        # Attitude quaternion [x, y, z, scalar]

bool wn_valid
float64[3] wn        # Angular velocity [rad/s]

bool pos_r_valid
float64[3] pos_r     # Position relative to reference orbit [m]

bool vel_r_valid
float64[3] vel_r     # Velocity relative to reference orbit [m/s]

bool svb_valid
float64[3] svb       # Sun vector (unit vector) in spacecraft body frame.
                     # 42 stores svb at SC level (not per-body), so an
                     # override applies to the whole spacecraft.

bool bvb_valid
float64[3] bvb       # Magnetic field in body frame [Tesla]

bool hvb_valid
float64[3] hvb       # Total angular momentum in body frame [Nms]

# Wheel momentum overrides (variable-length)
bool whl_h_valid
float64[] whl_h      # Wheel angular momentum [Nms]

# Wheel torque command overrides (variable-length)
bool whl_tcmd_valid
float64[] whl_tcmd   # Wheel torque commands [Nm]

# MTB magnetic moment command overrides (variable-length)
bool mtb_mcmd_valid
float64[] mtb_mcmd   # MTB magnetic moment commands [A-m^2]

# Joint position overrides (variable-length, flattened Ng x 3)
bool joint_pos_valid
float64[] joint_pos  # Joint positions (flattened [Ng x 3])
