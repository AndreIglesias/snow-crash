#!/usr/bin/env bash

docker build --progress=plain -t flag-cont . && docker run --network host -it flag-cont