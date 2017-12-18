FROM mongo:latest

ENV AUTH yes
 
COPY ./mongo_scripts2 /mongo_scripts

RUN chmod +rx /mongo_scripts/*.sh

CMD ["/mongo_scripts/run.sh"]