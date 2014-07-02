#!/bin/bash

#####################################################################################
# Copyright 2014 Normation SAS
#####################################################################################
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, Version 3.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
#####################################################################################

set -e

# Avoid any environment pollution that may cause package installation to fail
export LANG=C LC_ALL=C

# Import GPG key
apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 474A19E8 >> /tmp/log

# Add Rudder repository and update local package database
echo "deb http://www.rudder-project.org/apt-2.11-nightly/ $(lsb_release -cs) main" > /etc/apt/sources.list.d/rudder.list
aptitude update >> /tmp/log
