# SC[i].B[k] body states for all rigid bodies
builtin_interfaces/Time stamp
uint32 num_bodies
float64[] wn   # Flattened [Nb x 3]: angular velocity per body [rad/s]
float64[] qn   # Flattened [Nb x 4]: quaternion per body [x, y, z, scalar]
