/*The demo of grasping object, which use find_obj_3d to  locate the object


 Author：Simple

*/

#include "grasp_demo/find_obj_grasp.h"

grasp::grasp() : armgroup("manipulator"), move_finish(false), find_enable(false), joint_group_positions(6)
{
    try
    {
        //获取终端link的名称
        end_effector_link = armgroup.getEndEffectorLink();

        //设置目标位置所使用的参考坐标系
        reference_frame = "base_link";
        armgroup.setPoseReferenceFrame(reference_frame);

        //当运动规划失败后，允许重新规划
        armgroup.allowReplanning(true);

        //设置位置(单位：米)和姿态（单位：弧度）的允许误差
        armgroup.setGoalPositionTolerance(0.001);
        armgroup.setGoalOrientationTolerance(0.01);

        tf_sub = nh_.subscribe("/yolov5/BoundingBoxes", 1, &grasp::pose_callback, this); ////订阅yolov5识别的结果
        pose_client = nh_.serviceClient<grasp_demo::CamToReal>("cam_to_real"); //调用像素坐标映射到三维坐标接口，传入像素坐标，返回物体距离机械臂的实际坐标xyz
        client = nh_.serviceClient<grasp_demo::EyetoHand>("eyetohand"); // 调用机械臂的坐标变化
    }
    catch (const std::exception &e)
    {
        ROS_WARN_STREAM("run error: " << e.what());
    }
}

grasp::~grasp()
{
    ROS_INFO("Delete the class");
}


void grasp::pose_callback(const yolov5_ros_msgs::BoundingBoxes &yolo_tmp)
{
    // 获取当前识别到的类别和物体的中心坐标


    if (find_enable)
    {
        for (int i = 0; i < yolo_tmp.bounding_boxes.size(); i++)
        {
            if (strcmp(yolo_tmp.bounding_boxes[i].Class.c_str(), Object_class.c_str()) == 0)
            {
                pixel_x = (yolo_tmp.bounding_boxes[i].xmin + yolo_tmp.bounding_boxes[i].xmax) / 2.0;
                pixel_y = (yolo_tmp.bounding_boxes[i].ymin + yolo_tmp.bounding_boxes[i].ymax) / 2.0;
                break;
            }
        }
    }

    if (pixel_x != 0 )
    {
        find_enable = false;
    }

}

// 笛卡尔运动路径规划
double grasp::planPath(vector<geometry_msgs::Pose> waypoints)
{
    moveit_msgs::RobotTrajectory trajectory;
    const double jump_threshold = 0.0;
    const double eef_step = 0.01;
    double fraction = 0.0;
    int maxtries = 100;
    int attempts = 0;

    while (fraction < 1.0 && attempts < maxtries)
    {
        fraction = armgroup.computeCartesianPath(waypoints, eef_step, jump_threshold, trajectory);
        attempts++;

        if (attempts % 10 == 0)
            ROS_INFO("Still trying after %d attempts...", attempts);
    }

    if (fraction == 1)
    {
        ROS_INFO("Path computed successfully. Moving the arm.");

        // 生成机械臂的运动规划数据
        moveit::planning_interface::MoveGroupInterface::Plan plan;
        plan.trajectory_ = trajectory;

        // 执行运动
        armgroup.execute(plan);
        sleep(1);
    }
    else
    {
        ROS_INFO("Path planning failed with only %0.6f success after %d attempts.", fraction, maxtries);
    }
    return fraction;
}

void grasp::goSP()
{
    std::vector<double> joint_group_positions(6);
    joint_group_positions[0] = -4.835671726857321;
    joint_group_positions[1] = -1.67772084871401;
    joint_group_positions[2] = -2.371448818837301;
    joint_group_positions[3] = -5.448084537182943;
    joint_group_positions[4] = 1.7377156019210815;
    joint_group_positions[5] = 3.189060688018799;

    armgroup.setJointValueTarget(joint_group_positions);
    armgroup.move();
}

void grasp::getObjPose()
{
    current_pose = armgroup.getCurrentPose().pose;
    ros::service::waitForService("cam_to_real");

    grasp_demo::CamToReal srv;
    srv.request.pixel_x = pixel_x; // 输入像素坐标x
    srv.request.pixel_y = pixel_y; // 输入像素坐标y

    pose_client.call(srv);
    Obj_pose.pose.position.x = srv.response.obj_x; // 返回物体距离相机的实际坐标xyz
    Obj_pose.pose.position.y = srv.response.obj_y;
    Obj_pose.pose.position.z = srv.response.obj_z;

    ros::service::waitForService("eyetohand");
    grasp_demo::EyetoHand srv1;

    /* 坐标转化接口需要输入物体的xyz，以及机械臂当前状态的xyz和rpy。*/
    srv1.request.marker_x = Obj_pose.pose.position.x;
    srv1.request.marker_y = Obj_pose.pose.position.y;
    srv1.request.marker_z = Obj_pose.pose.position.z;

    /*得到物体在机械臂基坐标系下的坐标 */
    if (client.call(srv1))
    {
        target_pose.position.x = srv1.response.obj_x;
        target_pose.position.y = srv1.response.obj_y;
        target_pose.position.z = srv1.response.obj_z;

        cout << target_pose << '\n';
    }
    else
    {
        ROS_ERROR("Failed to call service hand_to_eye");
    }

    target_pose.orientation = current_pose.orientation;
}

void grasp::goObj()
{
    target_pose.position.x = -target_pose.position.x;
    target_pose.position.y = -target_pose.position.y;
    std::cout << target_pose << std::endl;
    target_pose.position.y += 0.15;
    //往后缩10厘米

    vector<geometry_msgs::Pose> waypoint1;
    waypoint1.push_back(target_pose);
    planPath(waypoint1) ;

    vector<geometry_msgs::Pose> waypoint12;
    target_pose.position.y -= 0.07;
    waypoint12.push_back(target_pose);
    planPath(waypoint12) ;

    vector<geometry_msgs::Pose> waypoint13;
    target_pose.position.y += 0.07;
    waypoint13.push_back(target_pose);
    planPath(waypoint13) ;
    //sleep(20);
    
    // armgroup.setPoseTarget(target_pose);
    // armgroup.move();
}

void grasp::liftObj()
{
    std::vector<double> joint_group_positions2(6);
    joint_group_positions2[0] = -3.131;
    joint_group_positions2[1] = -2.038;
    joint_group_positions2[2] = -1.745;
    joint_group_positions2[3] = -5.714;
    joint_group_positions2[4] = 1.745;
    joint_group_positions2[5] = 3.184;

    armgroup.setJointValueTarget(joint_group_positions2);
    armgroup.move();

}

void grasp::goHome()
{
    std::vector<double> joint_group_positions3(6);
    joint_group_positions3[0] = -3.580;
    joint_group_positions3[1] = -1.515;
    joint_group_positions3[2] = -2.43;
    joint_group_positions3[3] = -5.547;
    joint_group_positions3[4] = 1.447;
    joint_group_positions3[5] = 3.210;

    armgroup.setJointValueTarget(joint_group_positions3);
    armgroup.move();
}

void grasp::initMove()
{
    /*
    1. 机械臂运动到初始状态
    2. yolov5 识别物体的中心像素坐标
    3. 像素坐标转换为物体在相机坐标系下xyz
    4. 手眼矩阵转化，把物体在相机坐标系下的坐 标转化到物体在机械臂基坐标系下的坐标
    5. 控制机械臂运动到物体的上方，然后向下抓取
    6. 移动物体
    7. 机械臂回到初始状态
    */
    ros::AsyncSpinner spinner(1);
    spinner.start();
    ros::WallDuration(3.0).sleep();
    //1. 机械臂运动到初始状态
    goSP(); 
    ROS_INFO("arrive at start point");
    sleep(1);

    ROS_INFO_STREAM("Enter the object you want to grab?");
    cin >> Object_class;
    // 2. yolov5 识别物体的中心像素坐标
    find_enable = true; 
    sleep(3);
    if (find_enable == false)
    {
        // step 3. and step 4.
        getObjPose();
        // 5. 控制机械臂运动到物体的上方，然后向下抓取
        goObj();    
        sleep(1);
        // 6. 移动物体
        liftObj();
        sleep(1);
        // 7. 机械臂回到初始状态
        goHome();
        // goSP(); 
        //ROS_INFO("go home ");
        find_enable = false;
        pixel_x = 0;
    }
    else
    {
        ROS_INFO("cant find object");
    }

}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "grasp_obj");
    grasp _grasp;
    while (ros::ok())
    {
        _grasp.initMove();
        ros::spinOnce();
        if (_grasp.move_finish)
        {
            ros::shutdown();
        }
    }
}
