FROM kalilinux/kali-rolling

RUN apt-get update && \
    apt-get install -y --no-install-recommends ssh sshpass

WORKDIR /usr/src

COPY flag07.sh .

RUN chmod +x flag07.sh

CMD ["./flag07.sh", "localhost", "4243", "wiok45aaoguiboiki2tuin6ub"]
