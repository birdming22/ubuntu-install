# README

## A stop job is running for Session c2 of user

A workaround to this problem is to reduce this timeout in /etc/systemd/system.conf down from 90s to for example 10s:

DefaultTimeoutStopSec=10s
