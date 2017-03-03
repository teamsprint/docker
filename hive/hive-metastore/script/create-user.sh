#!/bin/sh

sleep 10
mysql -uroot -proot mysql < /root/create-user.sql 2> /dev/null

#eof
