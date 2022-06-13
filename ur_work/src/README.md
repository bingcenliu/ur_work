# 1. 打开相机的指令:

roslaunch realsense2_camera rs_aligned_depth.launch

# 2, 激活yolo5
conda activate mypytorch

roslaunch yolov5_ros yolo_v5.launch





# 2. 启动机械臂（192.168.1.10改为你的机械臂的ip。注意:机械臂和你的电脑要在同一网段，即在同一个有线或无线网络下):

## 2.1 启动机械臂的驱动
roslaunch ur_bringup ur3_bringup.launch robot_ip:=192.168.1.10

## 2.2 启动moveit!
roslaunch ur3_moveit_config ur5_moveit_planning_execution.launch

## 2.3 在Rviz下可视化机械手臂
roslaunch ur3_moveit_config moveit_rviz.launch config:=true

# 3. 打开手眼标定程序

roslaunch easy_handeye hand_eye_calibration.launch