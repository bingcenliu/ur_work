; Auto-generated. Do not edit!


(cl:in-package grasp_demo-srv)


;//! \htmlinclude EyetoHand-request.msg.html

(cl:defclass <EyetoHand-request> (roslisp-msg-protocol:ros-message)
  ((marker_x
    :reader marker_x
    :initarg :marker_x
    :type cl:float
    :initform 0.0)
   (marker_y
    :reader marker_y
    :initarg :marker_y
    :type cl:float
    :initform 0.0)
   (marker_z
    :reader marker_z
    :initarg :marker_z
    :type cl:float
    :initform 0.0))
)

(cl:defclass EyetoHand-request (<EyetoHand-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <EyetoHand-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'EyetoHand-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name grasp_demo-srv:<EyetoHand-request> is deprecated: use grasp_demo-srv:EyetoHand-request instead.")))

(cl:ensure-generic-function 'marker_x-val :lambda-list '(m))
(cl:defmethod marker_x-val ((m <EyetoHand-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grasp_demo-srv:marker_x-val is deprecated.  Use grasp_demo-srv:marker_x instead.")
  (marker_x m))

(cl:ensure-generic-function 'marker_y-val :lambda-list '(m))
(cl:defmethod marker_y-val ((m <EyetoHand-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grasp_demo-srv:marker_y-val is deprecated.  Use grasp_demo-srv:marker_y instead.")
  (marker_y m))

(cl:ensure-generic-function 'marker_z-val :lambda-list '(m))
(cl:defmethod marker_z-val ((m <EyetoHand-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grasp_demo-srv:marker_z-val is deprecated.  Use grasp_demo-srv:marker_z instead.")
  (marker_z m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <EyetoHand-request>) ostream)
  "Serializes a message object of type '<EyetoHand-request>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'marker_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'marker_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'marker_z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <EyetoHand-request>) istream)
  "Deserializes a message object of type '<EyetoHand-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'marker_x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'marker_y) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'marker_z) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<EyetoHand-request>)))
  "Returns string type for a service object of type '<EyetoHand-request>"
  "grasp_demo/EyetoHandRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'EyetoHand-request)))
  "Returns string type for a service object of type 'EyetoHand-request"
  "grasp_demo/EyetoHandRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<EyetoHand-request>)))
  "Returns md5sum for a message object of type '<EyetoHand-request>"
  "9743f28c3a9d1b192b8ad805848bdee3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'EyetoHand-request)))
  "Returns md5sum for a message object of type 'EyetoHand-request"
  "9743f28c3a9d1b192b8ad805848bdee3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<EyetoHand-request>)))
  "Returns full string definition for message of type '<EyetoHand-request>"
  (cl:format cl:nil "float64 marker_x~%float64 marker_y~%float64 marker_z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'EyetoHand-request)))
  "Returns full string definition for message of type 'EyetoHand-request"
  (cl:format cl:nil "float64 marker_x~%float64 marker_y~%float64 marker_z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <EyetoHand-request>))
  (cl:+ 0
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <EyetoHand-request>))
  "Converts a ROS message object to a list"
  (cl:list 'EyetoHand-request
    (cl:cons ':marker_x (marker_x msg))
    (cl:cons ':marker_y (marker_y msg))
    (cl:cons ':marker_z (marker_z msg))
))
;//! \htmlinclude EyetoHand-response.msg.html

(cl:defclass <EyetoHand-response> (roslisp-msg-protocol:ros-message)
  ((obj_x
    :reader obj_x
    :initarg :obj_x
    :type cl:float
    :initform 0.0)
   (obj_y
    :reader obj_y
    :initarg :obj_y
    :type cl:float
    :initform 0.0)
   (obj_z
    :reader obj_z
    :initarg :obj_z
    :type cl:float
    :initform 0.0))
)

(cl:defclass EyetoHand-response (<EyetoHand-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <EyetoHand-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'EyetoHand-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name grasp_demo-srv:<EyetoHand-response> is deprecated: use grasp_demo-srv:EyetoHand-response instead.")))

(cl:ensure-generic-function 'obj_x-val :lambda-list '(m))
(cl:defmethod obj_x-val ((m <EyetoHand-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grasp_demo-srv:obj_x-val is deprecated.  Use grasp_demo-srv:obj_x instead.")
  (obj_x m))

(cl:ensure-generic-function 'obj_y-val :lambda-list '(m))
(cl:defmethod obj_y-val ((m <EyetoHand-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grasp_demo-srv:obj_y-val is deprecated.  Use grasp_demo-srv:obj_y instead.")
  (obj_y m))

(cl:ensure-generic-function 'obj_z-val :lambda-list '(m))
(cl:defmethod obj_z-val ((m <EyetoHand-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grasp_demo-srv:obj_z-val is deprecated.  Use grasp_demo-srv:obj_z instead.")
  (obj_z m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <EyetoHand-response>) ostream)
  "Serializes a message object of type '<EyetoHand-response>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'obj_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'obj_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'obj_z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <EyetoHand-response>) istream)
  "Deserializes a message object of type '<EyetoHand-response>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'obj_x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'obj_y) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'obj_z) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<EyetoHand-response>)))
  "Returns string type for a service object of type '<EyetoHand-response>"
  "grasp_demo/EyetoHandResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'EyetoHand-response)))
  "Returns string type for a service object of type 'EyetoHand-response"
  "grasp_demo/EyetoHandResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<EyetoHand-response>)))
  "Returns md5sum for a message object of type '<EyetoHand-response>"
  "9743f28c3a9d1b192b8ad805848bdee3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'EyetoHand-response)))
  "Returns md5sum for a message object of type 'EyetoHand-response"
  "9743f28c3a9d1b192b8ad805848bdee3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<EyetoHand-response>)))
  "Returns full string definition for message of type '<EyetoHand-response>"
  (cl:format cl:nil "float64 obj_x~%float64 obj_y~%float64 obj_z~%~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'EyetoHand-response)))
  "Returns full string definition for message of type 'EyetoHand-response"
  (cl:format cl:nil "float64 obj_x~%float64 obj_y~%float64 obj_z~%~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <EyetoHand-response>))
  (cl:+ 0
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <EyetoHand-response>))
  "Converts a ROS message object to a list"
  (cl:list 'EyetoHand-response
    (cl:cons ':obj_x (obj_x msg))
    (cl:cons ':obj_y (obj_y msg))
    (cl:cons ':obj_z (obj_z msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'EyetoHand)))
  'EyetoHand-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'EyetoHand)))
  'EyetoHand-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'EyetoHand)))
  "Returns string type for a service object of type '<EyetoHand>"
  "grasp_demo/EyetoHand")