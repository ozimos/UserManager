mongo $MONGO_INITDB_DATABASE -u $MONGO_INITDB_ROOT_USERNAME -p $MONGO_INITDB_ROOT_PASSWORD --authenticationDatabase admin --eval "db.createUser({ 
    user: '$MONGODB_INITDB_USER', 
    pwd:  '$MONGODB_INITDB_PASS', 
    roles: [ { role: '$MONGODB_INITDB_ROLE', db: '$MONGO_INITDB_DATABASE' } ] 
    })"