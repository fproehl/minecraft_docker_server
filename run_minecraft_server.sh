#!/bin/bash

cd ${MINECRAFT_SERVER_DIR}
java -Xmx1024M -Xms1024M -jar server.jar nogui &
