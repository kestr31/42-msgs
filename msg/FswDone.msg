# FSW completion signal for the bridge's wait_for_fsw lockstep.
#
# Carries the seq of the StateOverride the FSW node has finished computing.
# The bridge waits until the matching StateOverride callback has landed
# (last_override_seq_ >= override_seq) before snapshotting RX, with a
# bounded timeout governed by `fsw_seq_match_timeout_ms`.
#
# Replaces the previous std_msgs/Empty payload (which had no way to bridge
# DDS's lack of cross-topic delivery ordering).

uint64 override_seq
