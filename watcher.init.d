#!/bin/bash
### BEGIN INIT INFO
# Provides:          watcher
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Start/stop Watcher that watches specified files/folders for changes
### END INIT INFO

PATH=/sbin:/usr/sbin:/bin:/usr/bin
DESC="Watches specified files/folders for changes"
NAME="watcher"
DAEMON="/usr/bin/watcher.py"
DAEMON_CONFIG="/etc/watcher.ini"
DAEMON_ARGS="-c $DAEMON_CONFIG"

# Exit if the package is not installed
[ -x "$DAEMON" ] || exit 0

start() {
    $DAEMON start $DAEMON_ARGS
}

stop() {
    $DAEMON stop $DAEMON_ARGS
}

restart() {
    $DAEMON restart $DAEMON_ARGS
}

case "$1" in
    start)
        start
        ;;

    stop)
        stop
        ;;
        
    restart|force-reload)
        restart
        ;;
        
    status)
        ;;
    *)
        echo "Usage: $SCRIPTNAME {start|stop|status|restart|force-reload}" >&2
        exit 3
        ;;
esac
