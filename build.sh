#! /bin/bash

docker buildx build --platform linux/amd64,linux/arm64 -t brunohenriquy/f2:latest .

docker push brunohenriquy/f2:latest
