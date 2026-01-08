# README

## A stop job is running for Session c2 of user

A workaround to this problem is to reduce this timeout in /etc/systemd/system.conf down from 90s to for example 10s:

DefaultTimeoutStopSec=10s

## XRDP performance

* xrdp client
  * sysctl -w net.core.wmem_max=8388608
* xrdp server
  * /etc/xrdp/xrdp.ini: tcp_send_buffer_bytes=3276800
