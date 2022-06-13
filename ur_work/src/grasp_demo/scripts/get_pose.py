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

# get joint values
joint_state_positions = arm_group.get_current_joint_values()
print (str(joint_state_positions))

#arm_group.set_joint_value_target([-0.008469980363796203, -1.7959581621099328, 1.29682112749129, -0.8684293162112118, -0.019328029216486797, 2.966797909442878])
#arm_group.go(wait=True)

# get current pose
current_pose = arm_group.get_current_pose()
print(current_pose)


moveit_commander.roscpp_initializer.roscpp_shutdown()
