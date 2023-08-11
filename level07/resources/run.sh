#/usr/bin/env bash

docker build --progress=plain -t flag07-cont . && docker run --network host -it flag07-cont
