FROM kalilinux/kali-rolling

RUN apt-get update && \
    apt-get install -y --no-install-recommends ssh sshpass

WORKDIR /usr/src

COPY flag05.sh .

RUN chmod +x flag05.sh

CMD ["./flag05.sh", "192.168.122.1", "4243", "ne2searoevaevoem4ov4ar8ap"]
