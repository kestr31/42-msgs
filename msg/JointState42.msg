# SC[i].G[k] joint data for all joints.
# Each joint has 3-DOF translational state (Pos, PosRate) and 3-DOF
# rotational state (Ang, AngRate); both expressed in the joint's
# mechanical frame as defined by the parent body. See 42types.h JointType
# (Pos, PosRate, Ang, AngRate) for the source-of-truth definition.
builtin_interfaces/Time stamp
uint32 num_joints
float64[] pos        # Flattened [Ng x 3]: per-joint translational state [m]
float64[] pos_rate   # Flattened [Ng x 3]: per-joint translational rate [m/s]
float64[] ang        # Flattened [Ng x 3]: per-joint Euler angles [rad]
float64[] ang_rate   # Flattened [Ng x 3]: per-joint angular rate [rad/s]
