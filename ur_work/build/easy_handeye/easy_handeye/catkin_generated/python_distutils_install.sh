#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/bingcenliu/ur_work/src/easy_handeye/easy_handeye"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/bingcenliu/ur_work/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/bingcenliu/ur_work/install/lib/python2.7/dist-packages:/home/bingcenliu/ur_work/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/bingcenliu/ur_work/build" \
    "/usr/bin/python2" \
    "/home/bingcenliu/ur_work/src/easy_handeye/easy_handeye/setup.py" \
     \
    build --build-base "/home/bingcenliu/ur_work/build/easy_handeye/easy_handeye" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/bingcenliu/ur_work/install" --install-scripts="/home/bingcenliu/ur_work/install/bin"
