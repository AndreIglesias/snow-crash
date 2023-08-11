#/usr/bin/env bash

docker build --progress=plain -t flag05-cont . && docker run --network host -it flag05-cont
