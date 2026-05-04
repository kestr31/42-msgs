# Bridge health/diagnostics topic.
#
# Published by sim42_bridge on:
#   - 1 Hz wall-clock timer (so it keeps publishing even if 42 is paused),
#   - on every event of interest (RX overflow, FSW timeout, ack mismatch,
#     reconnect/disconnect, parse error). Event publishes are de-duped to
#     <= one per ~100 ms so a fast failure mode does not saturate the topic.
#
# Counters are monotonic (never reset). Compare deltas across samples to
# spot regressions. They are atomic per-write but NOT cycle-atomic.

builtin_interfaces/Time stamp

bool   connected
uint32 reconnect_count
uint32 fsw_timeout_count
uint32 rx_overflow_count
uint32 ack_mismatch_count

uint32 whl_tcmd_overwrite_count
uint32 mtb_mcmd_overwrite_count
uint32 joint_pos_overwrite_count

# Cycles where on_fsw_done arrived but on_state_override did not deliver
# the matching seq within fsw_seq_match_timeout_ms. Non-zero indicates
# the FSW publisher is dropping overrides or the executor is starving.
uint32 seq_mismatch_count

# Cumulative count of TX lines the parser did not recognize. A non-zero
# delta between samples indicates 42's TX format has drifted from what
# the bridge knows (e.g. a 42 source change added a new variable that
# the parser does not yet handle). Surfaced from
# ProtocolParser::unrecognized_line_count().
uint64 unrecognized_lines

uint64 tx_cycles
uint64 rx_cycles

uint8 last_error

# last_error enum
uint8 ERR_NONE          = 0
uint8 ERR_RX_OVERFLOW   = 1
uint8 ERR_FSW_TIMEOUT   = 2
uint8 ERR_ACK_MISMATCH  = 3
uint8 ERR_DISCONNECT    = 4
uint8 ERR_PARSE         = 5
