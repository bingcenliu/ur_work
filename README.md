# 1. Command to open the camera:
source devel/setup.bash
roslaunch realsense2_camera rs_aligned_depth.launch
rqt_image_view

# 2, activate yolo5
conda activate mypytorch

roslaunch yolov5_ros yolo_v5.launch

# 2. Start the robotic arm (the robotic arm and the computer must be on the same network segment):

## 2.1 Start the drive of the robotic arm
roslaunch ur_robot_driver ur3_bringup.launch robot_ip:=192.168.0.254

## 2.2 Start moveit!
roslaunch ur3_moveit_config ur3_moveit_planning_execution.launch limited:=true

## 2.3 Visualize the robotic arm under Rviz
roslaunch ur3_moveit_config moveit_rviz.launch config:=true

# 3. start grab
roslaunch grasp_demo start_server.launch
