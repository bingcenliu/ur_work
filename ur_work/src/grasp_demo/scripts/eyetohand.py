#!/usr/bin/env python
# -*- coding: utf-8 -*-
import rospy
import math
import numpy as np
from grasp_demo.srv import *


def tf_transform(req):
    base_h_cam = np.array([[-0.9984, 0.0526, -0.0184, 0.0222],
                           [0.0175, -0.0177, -0.9997, 0.6702],
                           [-0.0529, -0.9985, 0.0167, 0.2853],
                           [0.0, 0.0, 0.0, 1.0]
                           ])

    cam_h_obj = np.array([[req.marker_x], [req.marker_y], [req.marker_z], [1]])
    base_h_obj = np.dot(base_h_cam, cam_h_obj)

    return EyetoHandResponse(base_h_obj[0, 0], base_h_obj[1, 0], base_h_obj[2, 0])


def obj_to_base_server():
    rospy.init_node('EyetoHand')

    s = rospy.Service('eyetohand', EyetoHand, tf_transform)

    rospy.spin()


if __name__ == "__main__":
    obj_to_base_server()
