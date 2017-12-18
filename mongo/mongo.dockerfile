
FROM mongo:latest

RUN apt-get update && apt-get install -y netcat-traditional netcat-openbsd

COPY ./mongo_scripts /mongo_scripts

RUN touch /.runonce

RUN chmod +rx /mongo_scripts/*.sh


CMD ["/mongo_scripts/start.sh"]