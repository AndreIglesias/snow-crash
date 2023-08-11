#/usr/bin/env bash

docker build -t flag00-cont . && docker run --network host -it flag00-cont
