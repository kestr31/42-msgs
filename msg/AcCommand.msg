# Aggregated AcOut payload — the FSW's per-cycle output to 42.
#
# This is the *sole* actuator-command channel. Wheel torque, MTB moment,
# thruster commands, gimbal commands, and the top-level Cmd quaternion
# stack all travel through this single message and reach 42 via AcIPC.
#
# State injection (qn, wn, PosR, VelR, svb, bvb, Hvb, Whl.H) lives on
# StateOverride and travels via ScIPC. The two channels do not overlap.
#
# Sub-messages are embedded for structural clarity; AcCommand remains the
# single atomic message on the wire (no separate topics, no timing issues).
builtin_interfaces/Time stamp

# Monotonic seq from the publisher (paired with FswDone.override_seq for
# lockstep handshake; mirrors StateOverride.seq).
uint64 seq

# FSW body-frame estimates (used by 42 after MapCmdsToActuators).
sim42_msgs/FswEstimate fsw_est

# Per-gimbal commands (flattened [Ng x N], empty = no gimbals).
sim42_msgs/GimbalCommand gimbal

# Wheel, MTB, and thruster commands.
sim42_msgs/ActuatorCommand actuator

# SC-level attitude/position reference setpoints.
sim42_msgs/GuidanceCommand guidance
