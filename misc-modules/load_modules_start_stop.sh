#!/bin/sh

case "$1" in
    start)
        scull.init
        # Load scull driver on startup
        scull_load
        # Load faulty driver on startup
        module_load faulty
        # Load hello module using modprobe
        modprobe hello
        ;;
    stop)
        # Unload scull driver on shutdown
        scull_unload
        # Unload faulty driver on shutdown
        module_unload faulty
        # Remove hello module using rmmod
        rmmod hello
        ;;
    *)
        echo "Usage: $0 {start|stop}"
        exit 1
        ;;
esac

exit 0
