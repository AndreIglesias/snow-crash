#/usr/bin/env bash

docker build --progress=plain -t flag02-cont . && docker run --network host -it flag02-cont
