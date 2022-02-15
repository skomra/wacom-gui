#!/bin/bash

#Make wacom-gui rpm release from the master for the latest version
VERSION=0.3.1
RELEASE=0
RELEASE_STRING=wacom-gui-$VERSION-$RELEASE

#Assume your current location is ~
sudo yum install git vim rpm-build make gcc 
mkdir ~/rpmbuild
mkdir ~/rpmbuild/SOURCES
cd ~
cp libwacom-1.11.tar.bz2 /home/aas/rpmbuild/SOURCES/
rm -rf wacom-gui-*
cp -r wacom-gui $RELEASE_STRING
cp wacom-gui/rpmbuild/wacom-gui.spec ~/rpmbuild/wacom-gui.spec
tar -czvf $RELEASE_STRING.tar.xz $RELEASE_STRING
cp $RELEASE_STRING.tar.xz ~/rpmbuild/SOURCES
rpmbuild --target noarch -bb rpmbuild/wacom-gui.spec
sudo yum remove wacom-gui -y
sudo yum install --skip-broken ./rpmbuild/RPMS/noarch/$RELEASE_STRING.noarch.rpm -y
