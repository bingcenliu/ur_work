#!/usr/bin/env python
#!coding=utf-8
 
import rospy
import numpy as np
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
import cv2
 
cam0_path  = '/home/zhitao/png/up/'    # 已经建立好的存储cam0 文件的目录
 
def callback(data):
    # define picture to_down' coefficient of ratio
    scaling_factor = 0.5
    global count,bridge
    str = input("Press '1' to save image \n")

    if str == 1:
        count =1
    else:
        count =0

    if count == 1:
        count = 0
        cv_img = bridge.imgmsg_to_cv2(data, "bgr8")
        timestr = "%.6f" %  data.header.stamp.to_sec()
              #%.6f表示小数点后带有6位，可根据精确度需要修改；
        image_name = timestr+ ".jpg" #图像命名：时间戳.jpg
        cv2.imwrite(cam0_path + image_name, cv_img)  #保存；
        cv2.imshow("frame" , cv_img)

    else:
        pass
 
def displayWebcam():
    rospy.init_node('image_save', anonymous=True)
 
    # make a video_object and init the video object
    global count,bridge
    count = 0
    bridge = CvBridge()
    rospy.Subscriber('/camera/rgb/image_raw', Image, callback, queue_size=1)
    rospy.spin()
 
if __name__ == '__main__':
    displayWebcam()
 
