FROM debian:latest

ENV GIT_SSL_NO_VERIFY=true

RUN apt-get update && \
    apt-get install -y --no-install-recommends ssh sshpass git gcc make libssl-dev build-essential

RUN git clone https://github.com/magnumripper/JohnTheRipper -b bleeding-jumbo john && \
    cd john/src/ && ./configure && make -s clean && make -sj4 && \
    alias john="$PWD/john/run/john"

WORKDIR /usr/src

COPY flag01.sh .

RUN chmod +x flag01.sh

CMD ["./flag01.sh", "10.24.8.7", "4243"]
