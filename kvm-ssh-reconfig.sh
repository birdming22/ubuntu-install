#!/bin/bash

\rm -rf /etc/ssh/ssh_host_*
dpkg-reconfigure openssh-server
service ssh restart

