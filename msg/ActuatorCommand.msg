# Wheel, MTB, and thruster commands.
# Array lengths must match Nwhl / Nmtb / Nthr respectively.
# Empty arrays indicate absent hardware on this spacecraft.
float64[] wheel_tcmd              # Wheel torque [Nm]
float64[] mtb_mcmd                # MTB magnetic moment [A-m^2]
float64[] thr_pulse_width_cmd     # Thruster pulse width [s]
float64[] thr_thrust_level_cmd    # Thruster thrust level [N or normalized]
