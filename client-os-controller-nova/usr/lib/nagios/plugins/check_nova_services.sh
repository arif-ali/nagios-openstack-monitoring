#!/bin/sh

RESULT=`sudo nova-manage service list | grep XXX | grep -c enabled`


if [ $RESULT -eq 0 ]
then
  echo -n "OK: All enabled services running."
  exit 0
fi


echo -n "CRITICAL: $RESULT services enabled but not running."
exit 2
