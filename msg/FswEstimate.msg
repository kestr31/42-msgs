# FSW body-frame estimates read by 42 into AC.svb / AC.bvb / AC.Hvb
# after MapCmdsToActuators. These are state estimates, not commands.
float64[3] svb    # Sun unit vector in body frame
float64[3] bvb    # Magnetic field in body frame [Tesla]
float64[3] hvb    # Total angular momentum in body frame [Nms]
