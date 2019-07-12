FROM ubuntu:latest

EXPOSE 19132/udp

ENV VERSION=1.12.0.28

# Install dependencies
RUN apt-get update && \
    apt-get install -y unzip curl libcurl4 libssl1.0.0

# Get bedrock server
RUN curl https://minecraft.azureedge.net/bin-linux/bedrock-server-$VERSION.zip --output bedrock-server.zip && \
    unzip bedrock-server.zip -d bedrock-server && \
    rm bedrock-server.zip

VOLUME ["/data"]

ADD config.sh /bedrock-server/config.sh
RUN chmod +x /bedrock-server/config.sh
RUN /bedrock-server/config.sh

RUN mkdir -p /data/worlds && \
    ln -s /data/worlds /bedrock-server/worlds

WORKDIR /bedrock-server
ENV LD_LIBRARY_PATH=.
CMD ./bedrock_server
