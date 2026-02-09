# Simulation time from 42 TIME line
# Format: TIME Year-DOY-HH:MM:SS.sssssssss
builtin_interfaces/Time stamp
int64 year
int64 doy        # Day of year
int64 hour
int64 minute
float64 second   # Fractional seconds (up to nanosecond precision)
float64 sim_sec  # Elapsed simulation seconds (computed by bridge)
