#!/usr/bin/env bash
##
 # Copyright © 2015 by David Alger. All rights reserved
 # 
 # Licensed under the Open Software License 3.0 (OSL-3.0)
 # See included LICENSE file for full text of OSL-3.0
 # 
 # http://davidalger.com/contact/
 ##

########################################
# configure local ssh

set -e

ssh-keygen -N '' -t rsa -f ~/.ssh/id_rsa

if [[ -f /vagrant/etc/authorized_keys ]]; then
    cp /vagrant/etc/authorized_keys ~/.ssh/authorized_keys

    # append new key to list of authorized_keys for use on new nodes; will be appened in build.sh on reload
    cat ~/.ssh/id_rsa.pub >> /vagrant/etc/authorized_keys

    chmod 600 ~/.ssh/authorized_keys
fi