#!/bin/bash

VERSION=1.12.2

curl https://launcher.mojang.com/mc/game/${VERSION}/server/886945bfb2b978778c3a0288fd7fab09d315b25f/server.jar -o server.jar
docker build .
