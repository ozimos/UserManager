FROM mongo:latest
 
COPY ./mongo_scripts3 /docker-entrypoint-initdb.d/
