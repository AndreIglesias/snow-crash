#/usr/bin/env bash

docker build --progress=plain -t flag03-cont . && docker run --network host -it flag03-cont
