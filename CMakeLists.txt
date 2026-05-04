cmake_minimum_required(VERSION 3.8)
project(sim42_msgs)

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

find_package(ament_cmake REQUIRED)
find_package(rosidl_default_generators REQUIRED)
find_package(std_msgs REQUIRED)
find_package(builtin_interfaces REQUIRED)

rosidl_generate_interfaces(${PROJECT_NAME}
  "msg/SimTime.msg"
  "msg/AttitudeState.msg"
  "msg/OrbitalState.msg"
  "msg/EnvironmentState.msg"
  "msg/WheelState.msg"
  "msg/ThrusterCommand.msg"
  "msg/JointState42.msg"
  "msg/JointCommand.msg"
  "msg/CssData.msg"
  "msg/CssArray.msg"
  "msg/FssData.msg"
  "msg/FssArray.msg"
  "msg/StarTrackerData.msg"
  "msg/StarTrackerArray.msg"
  "msg/GpsState.msg"
  "msg/GyroArray.msg"
  "msg/MagArray.msg"
  "msg/AccelArray.msg"
  "msg/BodyState.msg"
  "msg/StateOverride.msg"
  "msg/FswDone.msg"
  "msg/BridgeStatus.msg"
  "srv/GetSimStatus.srv"
  "srv/SetSimState.srv"
  "srv/ResetConnection.srv"
  DEPENDENCIES std_msgs builtin_interfaces
)

ament_package()
