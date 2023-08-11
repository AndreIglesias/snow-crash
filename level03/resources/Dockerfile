FROM kalilinux/kali-rolling

RUN apt-get update && \
    apt-get install -y --no-install-recommends ssh sshpass

WORKDIR /usr/src

COPY flag03.sh .

RUN chmod +x flag03.sh

CMD ["./flag03.sh", "localhost", "4243", "kooda2puivaav1idi4f57q8iq"]
