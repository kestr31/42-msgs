# SC[i].GPS[k] data for all GPS receivers
# Supports multiple GPS units, but typically one per SC
builtin_interfaces/Time stamp
bool valid
int64 rollover    # GPS week rollover counter
int64 week        # GPS week number
float64 sec       # Seconds within GPS week
float64[3] pos_n  # Position in N frame [m]
float64[3] vel_n  # Velocity in N frame [m/s]
float64[3] pos_w  # Position in W (ECEF) frame [m]
float64[3] vel_w  # Velocity in W (ECEF) frame [m/s]
