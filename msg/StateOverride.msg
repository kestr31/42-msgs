# SC truth-state override sent to 42 via ScIPC RX.
#
# This message is the *state injection* channel: setting initial conditions,
# replaying recorded state, fault injection. It is NOT an actuator command
# channel — wheel torque, MTB moment, thruster, gimbal commands all travel
# via AcCommand on AcIPC and have no representation here.
#
# Each field has a corresponding _valid flag; only valid fields are sent.
builtin_interfaces/Time stamp

# Monotonic seq from the publisher (0 = unset; older callers omit this).
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

# Wheel angular-momentum state override (initial conditions, fault
# injection). NOT a torque command — wheel torque travels via AcCommand.
bool whl_h_valid
float64[] whl_h      # Wheel angular momentum [Nms]

# CommLink state override (per-link injection)
bool comm_links_valid
sim42_msgs/CommLinkData[] comm_links
