FROM kalilinux/kali-rolling

RUN apt-get update && \
    apt-get install -y --no-install-recommends ssh sshpass john

WORKDIR /usr/src

COPY flag01.sh .

RUN chmod +x flag01.sh

CMD ["./flag01.sh", "localhost", "4243", "x24ti5gi3x0ol2eh4esiuxias"]
