#!/bin/bash
chown -R wowza:wowza /usr/local/WowzaMediaServer*
chmod -R 775 /usr/local/WowzaMediaServer*
rm -f /var/run/WowzaMediaServer.pid
rm -f /var/run/WowzaMediaServer.lock
/bin/cp deploy/startup.sh bin
/bin/cp deploy/wms.sh bin
