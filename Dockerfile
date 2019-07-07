FROM ubuntu:latest

EXPOSE 19132/udp
EXPOSE 19132/tcp

ENV VERSION=1.11.4.2

# Install dependencies
RUN apt-get update && \
    apt-get install -y unzip curl libcurl4 libssl1.0.0

# Get bedrock server
RUN curl https://minecraft.azureedge.net/bin-linux/bedrock-server-$VERSION.zip --output bedrock-server.zip && \
    unzip bedrock-server.zip -d bedrock-server && \
    rm bedrock-server.zip

VOLUME /data

RUN mkdir /data/worlds && \
    ln -s /data/worlds /bedrock-server/worlds

RUN mv /bedrock-server/server.properties /data && \
    mv /bedrock-server/permissions.json /data && \
    mv /bedrock-server/whitelist.json /data && \
    ln -s /data/server.properties /bedrock-server/server.properties && \
    ln -s /data/permissions.json /bedrock-server/permissions.json && \
    ln -s /data/whitelist.json /bedrock-server/whitelist.json

WORKDIR /bedrock-server
ENV LD_LIBRARY_PATH=.
CMD ./bedrock_server
