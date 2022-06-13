#include <iostream>
#include <string>
#include <opencv2/opencv.hpp>
#include <ros/ros.h>
#include <cv_bridge/cv_bridge.h>
#include <geometry_msgs/PointStamped.h>
#include <image_transport/image_transport.h>
#include <sensor_msgs/CameraInfo.h>
#include <sensor_msgs/Image.h>
#include "grasp_demo/CamToReal.h"
#include <algorithm>
#include <stdlib.h>

using namespace cv;
using namespace std;

class ImageConverter
{
private:
	ros::NodeHandle nh_;
	image_transport::ImageTransport it_;
	image_transport::Subscriber image_sub_depth; //接收深度图像
	image_transport::Subscriber image_sub_color; //接收彩色图像

	ros::Subscriber camera_info_sub_; //接收深度图像对应的相机参数话题

	ros::ServiceServer CamToReal;
	double xmin, ymin, xmax, ymax, depth;
	int mid_pos[2];
	int min_val;

	sensor_msgs::CameraInfo camera_info;
	geometry_msgs::PointStamped output_point;

	/* Mat depthImage,colorImage; */
	Mat colorImage;
	Mat depthImage = Mat::zeros(480, 640, CV_16UC1); // camera_info
	// Mat depthImage = Mat::zeros(480, 640, CV_32FC1); // Kinetc

public:
	ImageConverter() : it_(nh_)
	{
		image_sub_depth = it_.subscribe("/camera/aligned_depth_to_color/image_raw",
										1, &ImageConverter::imageDepthCb, this);

		image_sub_color = it_.subscribe("/camera/color/image_raw", 1,
										&ImageConverter::imageColorCb, this);
		camera_info_sub_ = nh_.subscribe("/camera/aligned_depth_to_color/camera_info", 1,
										 &ImageConverter::cameraInfoCb, this);
		CamToReal = nh_.advertiseService("/cam_to_real", &ImageConverter::CamToRealCallback, this);
	}

	~ImageConverter()
	{
	}

	void cameraInfoCb(const sensor_msgs::CameraInfo &msg)
	{
		camera_info = msg;
	}

	void imageDepthCb(const sensor_msgs::ImageConstPtr &msg)
	{
		cv_bridge::CvImagePtr cv_ptr;

		try
		{
			cv_ptr =
				cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::TYPE_16UC1);
			depthImage = cv_ptr->image;
		}
		catch (cv_bridge::Exception &e)
		{
			ROS_ERROR("cv_bridge exception: %s", e.what());
			return;
		}
	}

	void imageColorCb(const sensor_msgs::ImageConstPtr &msg)
	{
		cv_bridge::CvImagePtr cv_ptr;
		try
		{
			cv_ptr = cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::BGR8);
			colorImage = cv_ptr->image;
		}
		catch (cv_bridge::Exception &e)
		{
			ROS_ERROR("cv_bridge exception: %s", e.what());
			return;
		}
	}

	bool CamToRealCallback(grasp_demo::CamToReal::Request &req,
						   grasp_demo::CamToReal::Response &res)
	{
		mid_pos[0] = req.pixel_x;
		mid_pos[1] = req.pixel_y;
		min_val = std::min(mid_pos[0], mid_pos[1]);

		int get_distance = 0;

		for (int i = 0; i<10 && get_distance != 1 ; i++)
		{

			for (int j = mid_pos[0] - i; j<mid_pos[0] + i && get_distance != 1; j++)
				{
					for (int k = mid_pos[1] - i; k<mid_pos[1] + i; k++)
					{
						double dist = depthImage.at<u_int16_t>(k, j);
						if (dist != 0)
						{
							depth = 0.001 * dist;  // Realsense
							mid_pos[0] = j;
							mid_pos[1] = k;
							get_distance = 1;
							dist = 0;
							break;
						}
					}
				}
		}
		cout << "Depth " << depth << "\n";

		float real_z = depth;
		float real_x =
			(mid_pos[0] - camera_info.K.at(2)) / camera_info.K.at(0) * real_z;
		float real_y =
			(mid_pos[1] - camera_info.K.at(5)) / camera_info.K.at(4) * real_z;
		if (real_z != 0)
		{
			res.obj_x = real_x;
			res.obj_y = real_y;
			res.obj_z = real_z;
			res.result = true;
		}
		else
		{
			res.obj_x = 0.0;
			res.obj_y = 0.0;
			res.obj_z = 0.0;
			res.result = false;
		}
		return true;

	}
};

int main(int argc, char **argv)
{
	ros::init(argc, argv, "coordinate_map");
	ImageConverter imageconverter;
	ros::AsyncSpinner spinner(1);
	spinner.start();
	ros::waitForShutdown();
}
