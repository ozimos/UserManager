#!/bin/bash
# wait-for-mongo.sh

set -e

host="$1"
shift
cmd="$@"

until mongoose.connect('mongodb://john:doe@mongo:27017/userManager') & mongoose.connection.close() ; do
  >&2 echo "mongo is unavailable - sleeping"
  sleep 1
done

>&2 echo "mongo is up - executing command"
exec $cmd
