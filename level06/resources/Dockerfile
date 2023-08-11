FROM kalilinux/kali-rolling

RUN apt-get update && \
    apt-get install -y --no-install-recommends ssh sshpass

WORKDIR /usr/src

COPY flag06.sh .

RUN chmod +x flag06.sh

CMD ["./flag06.sh", "localhost", "4243", "viuaaale9huek52boumoomioc"]
