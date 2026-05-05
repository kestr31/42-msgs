cmake_minimum_required(VERSION 3.8)
project(sim42_msgs)

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

find_package(ament_cmake REQUIRED)
find_package(rosidl_default_generators REQUIRED)
find_package(builtin_interfaces REQUIRED)

rosidl_generate_interfaces(${PROJECT_NAME}
  "msg/SimTime.msg"
  "msg/AttitudeState.msg"
  "msg/OrbitalState.msg"
  "msg/EnvironmentState.msg"
  "msg/WheelState.msg"
  "msg/JointState42.msg"
  "msg/CssData.msg"
  "msg/CssArray.msg"
  "msg/FssData.msg"
  "msg/FssArray.msg"
  "msg/StarTrackerData.msg"
  "msg/StarTrackerArray.msg"
  "msg/GpsData.msg"
  "msg/GpsArray.msg"
  "msg/GyroArray.msg"
  "msg/MagArray.msg"
  "msg/AccelArray.msg"
  "msg/BodyState.msg"
  "msg/StateOverride.msg"
  "msg/FswEstimate.msg"
  "msg/GimbalCommand.msg"
  "msg/ActuatorCommand.msg"
  "msg/GuidanceCommand.msg"
  "msg/AcCommand.msg"
  "msg/BridgeStatus.msg"
  "msg/WorldState.msg"
  "msg/CommLinkData.msg"
  "msg/CommLinkArray.msg"
  "srv/GetSimStatus.srv"
  "srv/SetSimState.srv"
  "srv/ResetConnection.srv"
  DEPENDENCIES builtin_interfaces
)

find_package(Doxygen QUIET)
if(DOXYGEN_FOUND)
  set(DOXYFILE_IN ${CMAKE_CURRENT_SOURCE_DIR}/doxygen/Doxyfile.in)
  set(DOXYFILE_OUT ${CMAKE_CURRENT_BINARY_DIR}/Doxyfile)
  configure_file(${DOXYFILE_IN} ${DOXYFILE_OUT} @ONLY)
  add_custom_target(doc
    COMMAND ${DOXYGEN_EXECUTABLE} ${DOXYFILE_OUT}
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
    COMMENT "Generating sim42_msgs documentation with Doxygen"
    VERBATIM
  )
  find_program(LATEXMK latexmk)
  if(LATEXMK)
    add_custom_target(doc-pdf
      COMMAND ${DOXYGEN_EXECUTABLE} ${DOXYFILE_OUT}
      COMMAND ${CMAKE_COMMAND} -E chdir ${CMAKE_CURRENT_BINARY_DIR}/doc_output/latex
              ${LATEXMK} -pdf -interaction=nonstopmode refman.tex
      WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
      COMMENT "Generating sim42_msgs PDF documentation"
      VERBATIM
    )
  endif()
endif()

ament_package()
