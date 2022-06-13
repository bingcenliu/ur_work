
(cl:in-package :asdf)

(defsystem "grasp_demo-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "CamToReal" :depends-on ("_package_CamToReal"))
    (:file "_package_CamToReal" :depends-on ("_package"))
    (:file "EyetoHand" :depends-on ("_package_EyetoHand"))
    (:file "_package_EyetoHand" :depends-on ("_package"))
  ))