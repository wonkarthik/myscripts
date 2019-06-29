#!/bin/bash
# Example script to tar up files and push to
# remote git repo
#  http://hobo.house/2017/07/15/distributed-remote-backups-with-git-and-etckeeper/
# run once a day from cron
#0 11 * * * * sh /root/git-backup.sh >/dev/null 2>&1


# > is for redirect
# /dev/null is a black hole where any data sent, will be discarded
# 2 is the file descriptor for Standard Error
# > is for redirect
# & is the symbol for file descriptor (without it, the following 1 would be considered a filename)
# 1 is the file descriptor for Standard Out
# Therefore >/dev/null 2>&1 is redirect the output of your program to /dev/null. Include both the Standard Error and Standard Out.


date=$(/bin/date +%Y%m%d%H%M)
gitorigin="/root/backups/"
# this is a cloned remote repo
gitdest="vps-backup/"

function archive_files {
        tar cvf $gitorigin/vps-conf-backups-$date.tar \
        /etc/named.conf \
        /var/named/ \
        /etc/httpd/ \
        /etc/mail/ \
        /etc/opendkim/ \
        /etc/opendmarc.conf \
        /home/some_small_homedir
}

function backup_data {
        cd $gitorigin
        cp vps-conf-backups-$date.tar $gitdest
        cd $gitdest/
        git add vps-conf-backups-$date.tar
        git commit -m "auto backup of vps conf files $date"
        git push
}

archive_files
backup_data
