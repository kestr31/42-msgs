# ROS2 Message Definitions for NASA 42 Simulator

ROS2 Jazzy message and service definitions for the NASA 42 spacecraft simulator bridge.

22 message types mapping 42's native ROS2 IPC variables to structured ROS2 types. Covers spacecraft state, sensors (gyro, magnetometer, CSS, FSS, star tracker, GPS, accelerometer), actuators (wheels, MTBs, thrusters), joints, and state overrides.

## Build

```bash
source /opt/ros/jazzy/setup.bash
colcon build --packages-select sim42_msgs
```

## Documentation

Requires [Doxygen](https://www.doxygen.nl/) (and optionally `latexmk` for PDF output).

```bash
# Build the package first (configures Doxyfile.in)
source /opt/ros/jazzy/setup.bash
colcon build --packages-select sim42_msgs

# Generate HTML docs
colcon build --packages-select sim42_msgs --cmake-target doc

# Generate PDF docs (requires latexmk)
colcon build --packages-select sim42_msgs --cmake-target doc-pdf
```

Output is written to `build/sim42_msgs/doc_output/`. Open `html/index.html` for the HTML version or `latex/refman.pdf` for the PDF.

---
