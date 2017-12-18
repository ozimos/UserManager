FROM mongo:latest
 
COPY ./mongo_scripts /docker-entrypoint-initdb.d/
