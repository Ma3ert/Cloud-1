FROM debian:buster

COPY ./conf/redis.sh /bin/redis.sh

RUN apt-get update && apt-get install -y redis && chmod +x /bin/redis.sh

RUN bash /bin/redis.sh

CMD [ "redis-server", "--protected-mode", "no"]
