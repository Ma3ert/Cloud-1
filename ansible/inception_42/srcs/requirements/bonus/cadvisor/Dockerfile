FROM debian:buster

RUN apt-get update && apt-get install -y wget

RUN wget "https://github.com/google/cadvisor/releases/download/v0.39.2/cadvisor" && chmod +x cadvisor

CMD [ "./cadvisor" ]