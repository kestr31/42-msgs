# Aggregated AcOut payload — the FSW's per-cycle output to 42.
#
# This is the *sole* actuator-command channel. Wheel torque, MTB moment,
# thruster commands, gimbal commands, and the top-level Cmd quaternion
# stack all travel through this single message and reach 42 via AcIPC.
#
# State injection (qn, wn, PosR, VelR, svb, bvb, Hvb, Whl.H) lives on
# StateOverride and travels via ScIPC. The two channels do not overlap.
#
# Field order mirrors AcOut as defined in 42's WriteAcOutToSocket
# (42/Source/AutoCode/AcIPC.c) so the bridge's binary builder can copy
# straight from this message.
builtin_interfaces/Time stamp

# Monotonic seq from the publisher (paired with FswDone.override_seq for
# lockstep handshake; mirrors StateOverride.seq).
uint64 seq

# FSW estimates of body-frame Sun, B-field, and angular momentum that the
# FSW used to compute this cycle's commands. 42 reads these into AC.svb /
# AC.bvb / AC.Hvb after MapCmdsToActuators.
float64[3] svb_est
float64[3] bvb_est
float64[3] hvb_est

# Per-gimbal commands (length AC->Ng each; arrays flattened [Ng x N]).
float64[] joint_gcmd_qrl_flat        # [Ng x 4]
float64[] joint_gcmd_qrn_flat        # [Ng x 4]
float64[] joint_gcmd_ang_rate_flat   # [Ng x 3]
float64[] joint_gcmd_ang_flat        # [Ng x 3]
float64[] joint_gcmd_pos_rate_flat   # [Ng x 3]
float64[] joint_gcmd_pos_flat        # [Ng x 3]

# Wheels [Nwhl]
float64[] wheel_tcmd                 # Wheel torque command [Nm]

# MTBs [Nmtb]
float64[] mtb_mcmd                   # MTB magnetic moment command [A-m^2]

# Thrusters [Nthr]
float64[] thr_pulse_width_cmd        # Thruster pulse width command [s]
float64[] thr_thrust_level_cmd       # Thruster thrust level command [N or normalized]

# Top-level SC attitude/position commands (single per spacecraft).
float64[4] cmd_qrl                   # Reference-quaternion (lifted) [x, y, z, scalar]
float64[4] cmd_qrn                   # Reference-quaternion (Newtonian) [x, y, z, scalar]
float64[3] cmd_ang_rate              # [rad/s]
float64[3] cmd_ang                   # [rad]
float64[3] cmd_pos_rate              # [m/s]
float64[3] cmd_pos                   # [m]
