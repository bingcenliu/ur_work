execute_process(COMMAND "/home/bingcenliu/ur_work/build/easy_handeye/rqt_easy_handeye/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/bingcenliu/ur_work/build/easy_handeye/rqt_easy_handeye/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
