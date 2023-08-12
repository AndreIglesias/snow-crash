FROM kalilinux/kali-rolling

RUN apt-get update && \
    apt-get install -y --no-install-recommends ssh sshpass tshark xxd

WORKDIR /usr/src

COPY flag02.sh .

RUN chmod +x flag02.sh

CMD ["./flag02.sh", "192.168.122.1", "4243", "f2av5il02puano7naaf6adaaf"]
