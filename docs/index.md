# sim42_msgs Message Definitions

Custom ROS2 message types for the sim42_bridge, mapping NASA 42 simulator state variables to ROS2 topics.

All messages use the 42 TXRX text protocol unless noted otherwise. Quaternions follow the `[x, y, z, scalar]` convention throughout.

## Telemetry (42 -> ROS2)

### Time

| Message | 42 Source | Description |
|---------|-----------|-------------|
| [SimTime](SimTime.md) | `TIME` | Simulation clock: calendar date, time of day, elapsed seconds |

### Spacecraft State

| Message | 42 Source | Description |
|---------|-----------|-------------|
| [AttitudeState](AttitudeState.md) | `SC[i].qn`, `SC[i].wn` | Attitude quaternion and angular velocity |
| [OrbitalState](OrbitalState.md) | `SC[i].PosR/VelR`, `Orb[i].PosN/VelN` | Relative and absolute position/velocity |
| [EnvironmentState](EnvironmentState.md) | `SC[i].svb/bvb/Hvb` | Sun vector, magnetic field, angular momentum in body frame |
| [BodyState](BodyState.md) | `SC[i].B[k].wn/qn` | Per-rigid-body angular velocity and quaternion |

### Sensors

| Message | 42 Source | Description |
|---------|-----------|-------------|
| [GyroArray](GyroArray.md) | `SC[i].Gyro[k].TrueRate` | Angular rate per gyro axis |
| [MagArray](MagArray.md) | `SC[i].MAG[k].Field` | Magnetic field per magnetometer axis |
| [AccelArray](AccelArray.md) | `SC[i].Accel[k].TrueAcc` | Acceleration per accelerometer axis |
| [CssArray](CssArray.md) / [CssData](CssData.md) | `SC[i].CSS[k]` | Coarse sun sensor validity and illumination |
| [FssArray](FssArray.md) / [FssData](FssData.md) | `SC[i].FSS[k]` | Fine sun sensor validity and sun angles |
| [StarTrackerArray](StarTrackerArray.md) / [StarTrackerData](StarTrackerData.md) | `SC[i].ST[k]` | Star tracker validity and quaternion |
| [GpsState](GpsState.md) | `SC[i].GPS[k]` | GPS time, position/velocity in inertial and ECEF frames |

### Joints

| Message | 42 Source | Description |
|---------|-----------|-------------|
| [JointState42](JointState42.md) | `SC[i].G[k]` | Joint positions, rates, angles, angle rates (all joints) |

### Actuators (read-only)

| Message | 42 Source | Description |
|---------|-----------|-------------|
| [WheelState](WheelState.md) | `SC[i].Whl[k].H` | Reaction wheel angular momentum |

## Commands (ROS2 -> 42)

### State Override

| Message | 42 Source | Description |
|---------|-----------|-------------|
| [StateOverride](StateOverride.md) | `SC[i].*` (RX) | Selective override of attitude, orbit, environment, wheels, joints via validity flags |
| [JointCommand](JointCommand.md) | `SC[i].G[k].Pos` | Single-joint position command |

### Actuator Commands (future -- requires AcIPC binary protocol)

| Message | 42 Source | Description |
|---------|-----------|-------------|
| [WheelCommand](WheelCommand.md) | `Whl[k].Tcmd` | Reaction wheel torque commands |
| [MtbCommand](MtbCommand.md) | `MTB[k].Mcmd` | Magnetic torque bar moment commands |
| [ThrusterCommand](ThrusterCommand.md) | `Thr[k]` | Thruster pulse width commands |
