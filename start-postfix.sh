#!/bin/bash
#
# Essentially copied from /usr/lib/systemd/system/postfix.service

test -f /etc/sysconfig/postfix && . /etc/sysconfig/postfix

/etc/postfix/system/config_postfix
/etc/postfix/system/update_chroot
/etc/postfix/system/update_postmaps

/usr/sbin/postfix start

/etc/postfix/system/wait_qmgr 60
/etc/postfix/system/cond_slp register
