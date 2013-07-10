#!/bin/sh

_EXECJAVA=java
JAVA_OPTS="-server -Xmx1200M"

# Better garbage collection setting to avoid long pauses
#JAVA_OPTS="$JAVA_OPTS -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:NewSize=512m"

# Uncomment to log debug garbage collection information
#NOW=$(date +"%Y-%m-%d-%H-%M")
#JAVA_OPTS="$JAVA_OPTS -verbose:gc -Xloggc:"/usr/local/WowzaMediaServer/logs/gc_$NOW.log" -XX:+PrintGCDetails -XX:+PrintGCTimeStamps -XX:+PrintHeapAtGC -XX:+PrintGCApplicationConcurrentTime -XX:+PrintGCApplicationStoppedTime"

# Uncomment to write heap dump on OutOfMemoryError
#JAVA_OPTS="$JAVA_OPTS -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/usr/local/WowzaMediaServer"

# Uncomment to force Java to use specific language settings
#JAVA_OPTS="$JAVA_OPTS -Duser.language=en -Duser.country=US -Dfile.encoding=Cp1252"

# Uncomment to fix multicast crosstalk problem when streams share multicast port
JAVA_OPTS="$JAVA_OPTS -Djava.net.preferIPv4Stack=true"

WMSAPP_HOME=/usr/local/WowzaMediaServer
WMSCONFIG_HOME=/usr/local/WowzaMediaServer
WMSCONFIG_URL=

export WMSAPP_HOME WMSCONFIG_HOME JAVA_OPTS _EXECJAVA
