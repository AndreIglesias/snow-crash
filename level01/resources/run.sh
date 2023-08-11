#/usr/bin/env bash

docker build --progress=plain -t flag01-cont . && docker run --network host -it flag01-cont
