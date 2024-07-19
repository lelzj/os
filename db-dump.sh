#!/bin/sh

# Script to dump database
# 
# EXAMPLE USAGE:
# dbdump -d ARCHIVE -h localhost -u zdid -n 73306 -p -c
#
# If run on remote host, ater a dump is performed, the user could scp the file to a local drive
# This script prevents locking while it is running so that other queries will continue to run

usage()
{
cat << EOF
usage: $0 options

Script to dump database

OPTIONS: 
 -i Show this message
 -d Database name
 -t Table name
 -h Host name
 -u User name
 -p User password
 -n Port number
 -c Compression flag

EXAMPLE USAGE:
dbdump -d ARCHIVE -h localhost -u zdid -n 73306 -p -c

EOF
}

dbname=
table=
host=
user=
pass=
port=
comp=0
date=`date +%m-%d-%Y-%I:%m`

while getopts “id:t:h:u:pn:c“ OPTION
do
 case $OPTION in
  i)
  usage
  exit 1
  ;;
  d)
  dbname=$OPTARG
  ;;
  t)
  table=$OPTARG
  ;;
  h)
  host=$OPTARG
  ;;
  u)
  user=$OPTARG
  ;;
  p)
  pass=$OPTARG
  ;;
  n)
  port=$OPTARG
  ;;
  c)
  comp=1
  ;;
 esac
done

# Verify required parameters
if [[ -z $dbname ]] || [[ -z $host ]] || [[ -z $user ]]
then
 usage
 exit 1
fi;

# Determine the presense of a password
password="--password=$pass"
if [ -z "${pass}" ] 
then 
 password=-p
fi;

# Run the dump
mysqldump --default-character-set=latin1 --add-drop-database --skip-add-locks --skip-lock-tables -ifcK $dbname $table --host=$host --user=$user $password --port=$port >$dbname-$date.sql

# Gzip if instructed
if [ $comp == 1 ]
then
 gzip $dbname-$date.sql
fi;
