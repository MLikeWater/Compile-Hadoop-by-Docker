FROM ubuntu:16.04

MAINTAINER jiangshouzhuang <jiangshouzhuang@163.com>

# install dependencies for compiling hadoop
RUN apt-get update && \
    apt-get install -y wget \
                       libprotobuf-dev \
                       protobuf-compiler \
                       maven \
                       cmake \
                       build-essential \
                       pkg-config \
                       libssl-dev \
                       zlib1g-dev \
                       llvm-gcc \
                       automake \
                       autoconf \
                       make

# install Oracle JDK
RUN mkdir -p /usr/lib/jvm
COPY /root/compile-hadoop-by-docker/java-7-oracle /usr/lib/jvm/
ENV JAVA_HOME /usr/lib/jvm/java-7-oracle
ENV JRE_HOME $JAVA_HOME/jre  
ENV CLASSPATH .:$JAVA_HOME/lib:$JRE_HOME/lib  
ENV PATH $PATH:$JAVA_HOME/bin 

# Copy local compile.sh to container's path
COPY compile.sh /root/compile.sh

RUN chmod +x /root/compile.sh