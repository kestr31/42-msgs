# sim42_msgs

ROS2 Jazzy message and service definitions for the NASA 42 spacecraft simulator bridge.

22 message types and 3 service types mapping 42's text-based IPC protocol variables to structured ROS2 types. Covers spacecraft state, sensors (gyro, magnetometer, CSS, FSS, star tracker, GPS, accelerometer), actuators (wheels, MTBs, thrusters), joints, and state overrides.

## Build

```bash
source /opt/ros/jazzy/setup.bash
colcon build --packages-select sim42_msgs
```

## Documentation

See [docs/msgs/index.md](docs/msgs/index.md) for per-message documentation.
