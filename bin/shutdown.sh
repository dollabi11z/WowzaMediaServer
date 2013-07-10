#!/bin/sh
. ./setenv.sh
$_EXECJAVA -Dcom.wowza.wms.AppHome="$WMSAPP_HOME" -Dcom.wowza.wms.ConfigHome="$WMSCONFIG_HOME" -cp $WMSAPP_HOME/bin/wms-bootstrap.jar com.wowza.wms.bootstrap.Bootstrap stop
