#!/bin/sh

ARTIFACTSLOCATION=${1}
ALTHOSTNAME=${2}

sudo fetch ${ARTIFACTSLOCATION}scripts/config.xml

sed -i "" "s/ZZZALTHOSTNAMEZZZ/$ALTHOSTNAME/g" config.xml

sudo mkdir /conf
sudo cp config.xml /conf/config.xml

sudo env ASSUME_ALWAYS_YES=YES pkg install ca_root_nss
sudo fetch https://raw.githubusercontent.com/opn/update/bootstrap/opnsense-bootstrap.sh

sed -i "" "s/reboot/shutdown -r +1/g" opnsense-bootstrap.sh

sudo sh ./opnsense-bootstrap.sh -y