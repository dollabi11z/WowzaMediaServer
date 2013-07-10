#!/bin/sh
. ./setenv.sh
mode=standalone
if [ "$#" -eq 1 ];
then
mode=$1
fi

#chmod 600 ../conf/jmxremote.password
#chmod 600 ../conf/jmxremote.access

# NOTE: Here you can configure the JVM's built in JMX interface.
# See the "Server Management Console and Monitoring" chapter
# of the "User's Guide" for more information on how to configure the
# remote JMX interface in the [install-dir]/conf/Server.xml file.

JMXOPTIONS=-Dcom.sun.management.jmxremote=true
#JMXOPTIONS="$JMXOPTIONS -Djava.rmi.server.hostname=192.168.1.7"
#JMXOPTIONS="$JMXOPTIONS -Dcom.sun.management.jmxremote.port=1099"
#JMXOPTIONS="$JMXOPTIONS -Dcom.sun.management.jmxremote.authenticate=true"
#JMXOPTIONS="$JMXOPTIONS -Dcom.sun.management.jmxremote.ssl=false"
#JMXOPTIONS="$JMXOPTIONS -Dcom.sun.management.jmxremote.password.file=$WMSCONFIG_HOME/conf/jmxremote.password"
#JMXOPTIONS="$JMXOPTIONS -Dcom.sun.management.jmxremote.access.file=$WMSCONFIG_HOME/conf/jmxremote.access"

ulimit -n 20000 > /dev/null 2>&1

rc=144
while [ $rc -eq 144 ]
do

# log interceptor com.wowza.wms.logging.LogNotify - see Javadocs for ILogNotify
$_EXECJAVA $JAVA_OPTS $JMXOPTIONS -Dcom.wowza.wms.runmode="$mode" -Dcom.wowza.wms.native.base="linux" -Dcom.wowza.wms.AppHome="$WMSAPP_HOME" -Dcom.wowza.wms.ConfigURL="$WMSCONFIG_URL" -Dcom.wowza.wms.ConfigHome="$WMSCONFIG_HOME" -cp $WMSAPP_HOME/bin/wms-bootstrap.jar com.wowza.wms.bootstrap.Bootstrap start

rc=$?
done
