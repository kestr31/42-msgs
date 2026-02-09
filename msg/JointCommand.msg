# Joint position command sent to 42 via state override
# SC[i].G[k].Pos = [x y z]
builtin_interfaces/Time stamp
uint32 joint_index
float64[3] pos   # Desired joint position [3-DOF]
