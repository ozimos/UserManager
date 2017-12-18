#!/bin/bash

ROOT_USER=${MONGODB_ROOT_USERNAME}
ROOT_PASS=${MONGODB_ROOT_PASSWORD}
ROOT_DB="admin"
ROOT_ROLE=${MONGODB_ROOT_ROLE}

MODIFY_USER=${MONGODB_READWRITE_USERNAME}
MODIFY_PASS=${MONGODB_READWRITE_PASSWORD}
MODIFY_DB=${MONGODB_DBNAME}
MODIFY_ROLE=${MONGODB_READWRITE_ROLE}

# Start Mongod
echo "Starting Mongod"
echo "....waiting for Mongod"
/usr/bin/mongod &
while ! nc -vz localhost 27017; do sleep 1; done

# Create Root User
if [[ -n $ROOT_ROLE ]] && [[ -n $ROOT_PASS ]] && [[ -n $ROOT_USER ]]
then
	echo "Creating the root user: \"$ROOT_USER\"..."
	mongo $ROOT_DB --eval "db.createUser({ user: '$ROOT_USER', pwd: '$ROOT_PASS', roles: [ { role: '$ROOT_ROLE', db: '$ROOT_DB' } ] });"
fi

# Create user with read/write privileges
if [[ -n $MODIFY_ROLE ]] && [[ -n $MODIFY_DB ]] && [[ -n $MODIFY_USER ]] && [[ -n $MODIFY_PASS ]]
then
	echo "Creating modify user: \"$MODIFY_USER\"..."
	mongo $MODIFY_DB --eval "db.createUser({ user: '$MODIFY_USER', pwd: '$MODIFY_PASS', roles: [ { role: '$MODIFY_ROLE', db: '$MODIFY_DB' } ] });"
fi


# Stop MongoDB service
echo "Shutting down MongoDB after adding users/roles...."
/usr/bin/mongod --shutdown

echo "==============================================================="
echo "MongoDB accounts created: "
echo "USER: $ROOT_USER   | ROLE: $ROOT_ROLE"
echo "USER: $MODIFY_USER | ROLE: $MODIFY_ROLE | DATABASE: $MODIFY_DB"
echo "==============================================================="

export MONGODB_ROOT_PASSWORD=""
export MONGODB_PASSWORD=""

rm -f /.runonce