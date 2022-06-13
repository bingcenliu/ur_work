#! /usr/bin/env python
import sys
import rospy
import moveit_commander
import geometry_msgs
import tf

 
moveit_commander.roscpp_initializer.roscpp_initialize(sys.argv)
rospy.init_node('reset_pose', anonymous=True)
robot = moveit_commander.robot.RobotCommander()

arm_group = moveit_commander.move_group.MoveGroupCommander("manipulator")
joint_state_positions = arm_group.get_current_joint_values()
print (str(joint_state_positions))

arm_group.set_joint_value_target([-0.8662255464189359, -1.9162168159155328, 2.6865001718590378, -3.872553048272273, -0.7044089581561881, -0.01897064505755619])
arm_group.go(wait=True)

moveit_commander.roscpp_initializer.roscpp_shutdown()
