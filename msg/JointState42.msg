# SC[i].G[k] joint data for all joints
# Each joint has 3-DOF Pos, PosRate, Ang, AngRate
builtin_interfaces/Time stamp
uint32 num_joints
float64[] pos        # Flattened [Ng x 3]: joint positions
float64[] pos_rate   # Flattened [Ng x 3]: joint position rates
float64[] ang        # Flattened [Ng x 3]: joint angles [rad]
float64[] ang_rate   # Flattened [Ng x 3]: joint angle rates [rad/s]
