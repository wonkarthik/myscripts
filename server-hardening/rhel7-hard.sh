#!/bin/bash
# Title:    RHEL 6 Hardening
# Author:   Oageng Escobar Baruti
# Date:     24/08/2015
#
# DESCRIPTION: DISABLE / REMOVE / STOP / START / CONFIGURE
#
# Configure File Systems
cp /etc/fstab /etc/fstab.`date +%d%m%Y_%H:%M.%S`
mount -o remount,nodev /tmp
mount -o remount,nosuid /tmp
mount -o remount,noexec /tmp
mount --bind /tmp /var/tmp
mount -o remount,nodev /home
mount -o remount,nodev /dev/shm
mount -o remount,nosuid /dev/shm
mount -o remount,noexec /dev/shm
#
# Disable / Stop Unneccessary Services / Daemons
systemctl disable rhnsd off
systemctl disable chargen-dgram off
systemctl disable chargen-stream off
systemctl disable daytime-dgram off
systemctl disable daytime-stream off
systemctl disable echo-dgram off
systemctl disable echo-stream off
systemctl disable tcpmux-server off
systemctl disable avahi-daemon off
systemctl disable cups off
systemctl disable nfslock off
systemctl disable rpcgssd off
systemctl disable rpcbind off
systemctl disable rpcidmapd off
systemctl disable rpcsvcgssd off
#
#
# Start Important Services
#
#
# Remove Uncessary / Unneeded Packages / Programs
yum erase mcstrans
yum erase telnet-server
yum erase telnet
yum erase rsh-server
yum erase rsh
yum erase ypbind
yum erase ypserv
yum erase tftp
yum erase tftp-server
yum erase talk
yum erase talk-server
yum erase xinetd
yum erase dhcp
yum erase openldap-servers
yum erase openldap-clients
yum erase bind
yum erase vsftpd
yum erase httpd
yum erase dovecot
yum erase samba
yum erase squid
yum erase net-snmp
yum erase setroubleshoot
yum remove xorg-x11-server-common
#
# Configure Networking / Firewalls
#systemctl disable iptables on
systemctl disable iptables off
systemctl disable ip6tables off
#
#
yum install tcp_wrappers
#
