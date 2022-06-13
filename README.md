# 1. 打开相机的指令:
source devel/setup.bash
roslaunch realsense2_camera rs_aligned_depth.launch
rqt_image_view

# 2, 激活yolo5
conda activate mypytorch

roslaunch yolov5_ros yolo_v5.launch

# 3. 把像素转换为实际的XYZ
rosrun grasp_demo cam_to_real

# 4. 启动抓取
roslaunch grasp_demo start_server.launch


# 相机坐标转换机械bi坐标
rosrun grasp_demo eyetohand.py


# 获取当前机械臂的位置
rosrun grasp_demo get_pose.py


# 2. 启动机械臂（机械臂和电脑要在同一网段):

## 2.1 启动机械臂的驱动
roslaunch ur_robot_driver ur3_bringup.launch robot_ip:=192.168.0.254

## 2.2 启动moveit!
roslaunch ur3_moveit_config ur3_moveit_planning_execution.launch limited:=true

## 2.3 在Rviz下可视化机械手臂
roslaunch ur3_moveit_config moveit_rviz.launch config:=true

## 训练yolov5
python train.py --data data/voc_rgb.yaml --cfg models/yolov5s_rgb.yaml --weights weights/yolov5s.pt --batch-size 16 --epochs 50 --workers 4


python detect.py --source ./testfiles --weights runs/train/exp/weights/best.pt --conf-thres 0.3