# World ephemeris data from 42 simulator
builtin_interfaces/Time stamp
uint32 num_worlds
float64[] pos_h       # Flattened [Nw x 3]: heliocentric position [m]
float64[] eph_pos_n   # Flattened [Nw x 3]: ECI position [m]
float64[] eph_vel_n   # Flattened [Nw x 3]: ECI velocity [m/s]
