FROM kalilinux/kali-rolling

RUN apt-get update && \
    apt-get install -y --no-install-recommends ssh sshpass

WORKDIR /usr/src

COPY flags.sh dirtycow.c dirtycow.h Makefile getflags /usr/src/

RUN chmod +x flags.sh

CMD ["./flags.sh", "192.168.122.1", "4243"]
