#ifndef FIND_OBJ_GRASP_H
#define FIND_OBJ_GRASP_H

#include <iostream>
#include <ros/ros.h>
#include <moveit/move_group_interface/move_group_interface.h>
#include <moveit/planning_scene_interface/planning_scene_interface.h>
#include <math.h>
#include <geometry_msgs/PoseStamped.h>
#include <geometry_msgs/Pose.h>
#include "tf2_msgs/TFMessage.h"
#include "yolov5_ros_msgs/BoundingBoxes.h"
#include "grasp_demo/CamToReal.h"
#include "grasp_demo/EyetoHand.h"
#include "string.h"

using namespace std;

class grasp
{
private:
    moveit::planning_interface::MoveGroupInterface armgroup;
    string end_effector_link, reference_frame;
    ros::NodeHandle nh_;
    ros::Subscriber tf_sub;
    geometry_msgs::PoseStamped Obj_pose;
    bool find_enable;
    geometry_msgs::Pose target_pose, current_pose;
    vector<double> joint_group_positions;
    double pixel_x, pixel_y;
    ros::ServiceClient pose_client, client;
    string pause_,Object_class;

public:
    bool move_finish;
    grasp();
    ~grasp();
    void pose_callback(const yolov5_ros_msgs::BoundingBoxes &yolo_tmp);
    double planPath(vector<geometry_msgs::Pose> waypoints);
    void goSP();
    void getObjPose();
    void goObj();
    void liftObj();
    void goHome();
    void initMove();
};

#endif
