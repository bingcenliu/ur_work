;; Auto-generated. Do not edit!


(when (boundp 'grasp_demo::EyetoHand)
  (if (not (find-package "GRASP_DEMO"))
    (make-package "GRASP_DEMO"))
  (shadow 'EyetoHand (find-package "GRASP_DEMO")))
(unless (find-package "GRASP_DEMO::EYETOHAND")
  (make-package "GRASP_DEMO::EYETOHAND"))
(unless (find-package "GRASP_DEMO::EYETOHANDREQUEST")
  (make-package "GRASP_DEMO::EYETOHANDREQUEST"))
(unless (find-package "GRASP_DEMO::EYETOHANDRESPONSE")
  (make-package "GRASP_DEMO::EYETOHANDRESPONSE"))

(in-package "ROS")





(defclass grasp_demo::EyetoHandRequest
  :super ros::object
  :slots (_marker_x _marker_y _marker_z ))

(defmethod grasp_demo::EyetoHandRequest
  (:init
   (&key
    ((:marker_x __marker_x) 0.0)
    ((:marker_y __marker_y) 0.0)
    ((:marker_z __marker_z) 0.0)
    )
   (send-super :init)
   (setq _marker_x (float __marker_x))
   (setq _marker_y (float __marker_y))
   (setq _marker_z (float __marker_z))
   self)
  (:marker_x
   (&optional __marker_x)
   (if __marker_x (setq _marker_x __marker_x)) _marker_x)
  (:marker_y
   (&optional __marker_y)
   (if __marker_y (setq _marker_y __marker_y)) _marker_y)
  (:marker_z
   (&optional __marker_z)
   (if __marker_z (setq _marker_z __marker_z)) _marker_z)
  (:serialization-length
   ()
   (+
    ;; float64 _marker_x
    8
    ;; float64 _marker_y
    8
    ;; float64 _marker_z
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _marker_x
       (sys::poke _marker_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _marker_y
       (sys::poke _marker_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _marker_z
       (sys::poke _marker_z (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _marker_x
     (setq _marker_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _marker_y
     (setq _marker_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _marker_z
     (setq _marker_z (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass grasp_demo::EyetoHandResponse
  :super ros::object
  :slots (_obj_x _obj_y _obj_z ))

(defmethod grasp_demo::EyetoHandResponse
  (:init
   (&key
    ((:obj_x __obj_x) 0.0)
    ((:obj_y __obj_y) 0.0)
    ((:obj_z __obj_z) 0.0)
    )
   (send-super :init)
   (setq _obj_x (float __obj_x))
   (setq _obj_y (float __obj_y))
   (setq _obj_z (float __obj_z))
   self)
  (:obj_x
   (&optional __obj_x)
   (if __obj_x (setq _obj_x __obj_x)) _obj_x)
  (:obj_y
   (&optional __obj_y)
   (if __obj_y (setq _obj_y __obj_y)) _obj_y)
  (:obj_z
   (&optional __obj_z)
   (if __obj_z (setq _obj_z __obj_z)) _obj_z)
  (:serialization-length
   ()
   (+
    ;; float64 _obj_x
    8
    ;; float64 _obj_y
    8
    ;; float64 _obj_z
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _obj_x
       (sys::poke _obj_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _obj_y
       (sys::poke _obj_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _obj_z
       (sys::poke _obj_z (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _obj_x
     (setq _obj_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _obj_y
     (setq _obj_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _obj_z
     (setq _obj_z (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass grasp_demo::EyetoHand
  :super ros::object
  :slots ())

(setf (get grasp_demo::EyetoHand :md5sum-) "9743f28c3a9d1b192b8ad805848bdee3")
(setf (get grasp_demo::EyetoHand :datatype-) "grasp_demo/EyetoHand")
(setf (get grasp_demo::EyetoHand :request) grasp_demo::EyetoHandRequest)
(setf (get grasp_demo::EyetoHand :response) grasp_demo::EyetoHandResponse)

(defmethod grasp_demo::EyetoHandRequest
  (:response () (instance grasp_demo::EyetoHandResponse :init)))

(setf (get grasp_demo::EyetoHandRequest :md5sum-) "9743f28c3a9d1b192b8ad805848bdee3")
(setf (get grasp_demo::EyetoHandRequest :datatype-) "grasp_demo/EyetoHandRequest")
(setf (get grasp_demo::EyetoHandRequest :definition-)
      "float64 marker_x
float64 marker_y
float64 marker_z
---
float64 obj_x
float64 obj_y
float64 obj_z




")

(setf (get grasp_demo::EyetoHandResponse :md5sum-) "9743f28c3a9d1b192b8ad805848bdee3")
(setf (get grasp_demo::EyetoHandResponse :datatype-) "grasp_demo/EyetoHandResponse")
(setf (get grasp_demo::EyetoHandResponse :definition-)
      "float64 marker_x
float64 marker_y
float64 marker_z
---
float64 obj_x
float64 obj_y
float64 obj_z




")



(provide :grasp_demo/EyetoHand "9743f28c3a9d1b192b8ad805848bdee3")


