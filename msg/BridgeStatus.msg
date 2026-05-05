# Bridge health/diagnostics topic.
#
# Published by sim42_bridge on:
#   - 1 Hz wall-clock timer (so it keeps publishing even if 42 is paused),
#   - on every event of interest (RX overflow, FSW timeout, ack mismatch,
#     reconnect/disconnect, parse error, AC handshake transition). Event
#     publishes are de-duped to <= one per ~100 ms so a fast failure mode
#     does not saturate the topic.
#
# Counters are monotonic (never reset). Compare deltas across samples to
# spot regressions. They are atomic per-write but NOT cycle-atomic.
#
# Fields are split by transport: ScIPC (text) on the left, AcIPC (binary)
# on the right. The two channels carry disjoint duties — see the migration
# plan for the strict role split.

builtin_interfaces/Time stamp

# ---- ScIPC transport (SC truth telemetry + state override) ----
bool   sc_connected
uint32 sc_reconnect_count
uint32 sc_ack_mismatch_count
uint32 fsw_timeout_count
uint32 rx_overflow_count

# Cycles where on_fsw_done arrived but on_state_override did not deliver
# the matching seq within fsw_seq_match_timeout_ms.
uint32 seq_mismatch_count

# Cumulative count of TX lines the parser did not recognize. A non-zero
# delta indicates 42's TX format has drifted from what the bridge knows.
uint64 unrecognized_lines

uint64 sc_tx_cycles
uint64 sc_rx_cycles

# ---- AcIPC transport (sensors + actuator commands) ----
bool   ac_connected
bool   ac_handshake_complete
uint32 ac_reconnect_count
uint32 ac_ack_mismatch_count
uint32 ac_recv_timeout_count
uint32 ac_seq_mismatch_count
uint64 ac_in_cycles
uint64 ac_out_cycles

# AcArraySizes (surfaced after handshake; zero before).
uint64 nb
uint64 ng
uint64 nwhl
uint64 nmtb
uint64 nthr
uint64 ngyro
uint64 nmag
uint64 ncss
uint64 nfss
uint64 nst
uint64 ngps
uint64 nacc

# ---- Most recent error indicator ----
uint8 last_error

# last_error enum
uint8 ERR_NONE              = 0
uint8 ERR_RX_OVERFLOW       = 1
uint8 ERR_FSW_TIMEOUT       = 2
uint8 ERR_SC_ACK_MISMATCH   = 3
uint8 ERR_SC_DISCONNECT     = 4
uint8 ERR_PARSE             = 5
uint8 ERR_AC_DISCONNECT     = 6
uint8 ERR_AC_ACK_MISMATCH   = 7
uint8 ERR_AC_HANDSHAKE_FAIL = 8
uint8 ERR_AC_PARSE_FAIL     = 9
uint8 ERR_AC_RECV_TIMEOUT   = 10
