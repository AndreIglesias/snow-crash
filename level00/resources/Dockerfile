FROM debian:latest

RUN apt-get update && \
    apt-get install -y --no-install-recommends ssh sshpass

WORKDIR /usr/src

COPY flag00.sh .

RUN chmod +x flag00.sh

CMD ["./flag00.sh", "192.168.122.1", "4243"]
