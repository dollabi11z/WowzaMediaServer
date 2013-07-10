#!/bin/sh
. ./setenv.sh

$_EXECJAVA -cp $WMSAPP_HOME/bin/genkey.jar main.Main $1 $2 $3
