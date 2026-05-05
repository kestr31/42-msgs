# Single-receiver GPS reading from AcIPC.
# Element of GpsArray; one record per receiver in AC->Ngps.
bool valid
int64 rollover
int64 week
float64 sec
float64[3] pos_n     # Position in N-frame [m]
float64[3] vel_n     # Velocity in N-frame [m/s]
float64[3] pos_w     # Position in W-frame [m]
float64[3] vel_w     # Velocity in W-frame [m/s]
float64 lng          # Longitude [rad]
float64 lat          # Latitude [rad]
float64 alt          # Altitude [m]
float64 wgs_lng      # WGS84 Longitude [rad]
float64 wgs_lat      # WGS84 Latitude [rad]
float64 wgs_alt      # WGS84 Altitude [m]
