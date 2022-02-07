#!/bin/bash

#Make wacom-gui rpm release from the master for the latest version

#Assume your current location is ~
sudo yum install git vim rpm-build make gcc 
cd ~
cp libwacom-1.11.tar.bz2 /home/aas/rpmbuild/SOURCES/
rm -rf wacom-gui-0.3.1-rc1*
cp -r wacom-gui wacom-gui-0.3.1-rc1
cp wacom-gui/rpmbuild/wacom-gui.spec ~/rpmbuild/wacom-gui.spec
tar -czvf wacom-gui-0.3.1-rc1.tar.xz wacom-gui-0.3.1-rc1
cp wacom-gui-0.3.1-rc1.tar.xz ~/rpmbuild/SOURCES
rpmbuild --target noarch -bb rpmbuild/wacom-gui.spec
sudo yum remove wacom-gui -y
sudo yum install --skip-broken ./rpmbuild/RPMS/noarch/wacom-gui-0.3.1-rc1.noarch.rpm -y
