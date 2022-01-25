#!/bin/bash
#
# Essentially copied from /usr/lib/systemd/system/postfix.service

test -f /etc/sysconfig/postfix && . /etc/sysconfig/postfix

/usr/lib/postfix/systemd/config_postfix
/usr/lib/postfix/systemd/update_chroot
/usr/lib/postfix/systemd/update_postmaps

/usr/sbin/postfix start

/usr/lib/postfix/systemd/wait_qmgr 60
/usr/lib/postfix/systemd/cond_slp register
