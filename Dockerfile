FROM ubuntu
MAINTAINER Frank Proehl (frankproehl@web.de)
EXPOSE 25565 25565

#Add needed packages
RUN apt-get update \
    && apt-get install -y openjdk-8-jre \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#Create application user 
RUN groupadd minecraft \
    && useradd -g 1000 -m minecraft \
    && mkdir /home/minecraft/world

#Copy configuration files for server
COPY server.jar /home/minecraft 
COPY eula.txt /home/minecraft
COPY server.properties /home/minecraft
RUN chown -R minecraft:minecraft /home/minecraft

#Run server
USER minecraft
WORKDIR /home/minecraft
CMD ["java","-Xmx1G","-Xms1G","-jar","server.jar","nogui"]
