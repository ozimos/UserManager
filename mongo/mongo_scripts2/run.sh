#!/bin/bash
set -m
 
/usr/bin/mongod --auth  &
 
if [ ! -f /data/db/.mongodb_password_set ] 
then
    #/mongo_scripts/entrypoint.sh
    #/usr/bin/mongod $@ --bind_ip 0.0.0.0 &
    /mongo_scripts/set_mongodb_password.sh
#else
    #/usr/bin/mongod $@ --bind_ip 0.0.0.0 &

fi
fg 