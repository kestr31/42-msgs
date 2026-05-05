# Multi-receiver GPS array from AcIPC.
# Length matches AC->Ngps; ordering preserves AC-side index identity.
builtin_interfaces/Time stamp
uint64 frame_idx
GpsData[] gps
