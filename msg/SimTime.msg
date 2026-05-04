# Simulation time from 42 TIME line
# Format: TIME Year-DOY-HH:MM:SS.sssssssss
builtin_interfaces/Time stamp
int64 year
int64 doy        # Day of year
int64 hour
int64 minute
float64 second   # Fractional seconds (up to nanosecond precision)
float64 sim_sec  # Elapsed simulation seconds (computed by bridge)
# 42's continuous Terrestrial Dynamical Time (DynTime), seconds since J2000.
# Monotonic across UTC leap-second insertions — preferred for control-loop
# time references. Populated only when 42 emits a DynTime TX line; older
# sims will leave this 0.0.
float64 dyn_time_sec

# Monotonic counter identifying the bridge TX cycle this SimTime came from.
# `sim_sec` is NOT guaranteed injective across cycles (42's TIME-line
# precision can quantize two distinct integration steps to the same value,
# and reconnects can re-emit a frame), so `frame_idx` is the authoritative
# cycle key for downstream consumers needing per-frame pairing.
uint64 frame_idx
