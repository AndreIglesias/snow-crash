#/usr/bin/env bash

docker build --progress=plain -t flag06-cont . && docker run --network host -it flag06-cont
