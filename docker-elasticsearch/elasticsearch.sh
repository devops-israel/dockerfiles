#!/bin/sh
exec="$ES_HOME/bin/elasticsearch"
pidfile=/var/run/elasticsearch/elasticsearch.pid

export ES_HEAP_SIZE
export ES_HEAP_NEWSIZE
export ES_DIRECT_SIZE
export ES_JAVA_OPTS

# copied (mostly) from /etc/init.d/elasticsearch
[ -x $exec ] || exit 5
[ -f $CONF_FILE ] || exit 6
if [ -n "$MAX_LOCKED_MEMORY" -a -z "$ES_HEAP_SIZE" ]; then
    echo "MAX_LOCKED_MEMORY is set - ES_HEAP_SIZE must also be set"
    return 7
fi
if [ -n "$MAX_OPEN_FILES" ]; then
    ulimit -n $MAX_OPEN_FILES
fi
if [ -n "$MAX_LOCKED_MEMORY" ]; then
    ulimit -l $MAX_LOCKED_MEMORY
fi
if [ -n "$WORK_DIR" ]; then
    mkdir -p "$WORK_DIR"
    chown "$ES_USER":"$ES_GROUP" "$WORK_DIR"
fi
# if not running, start it up here, usually something like "daemon $exec"
exec runuser -s /bin/sh $ES_USER -c "\
    $exec -p $pidfile \
    -Des.default.path.home=$ES_HOME  \
    -Des.default.path.logs=$LOG_DIR  \
    -Des.default.path.data=$DATA_DIR \
    -Des.default.path.work=$WORK_DIR \
    -Des.default.path.conf=$CONF_DIR \
    "
