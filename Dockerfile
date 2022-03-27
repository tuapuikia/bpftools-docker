FROM ubuntu:18.04 as builder

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /opt

RUN apt update && \
    apt install git \
    bison \
    flex \
    ipset \
    iptables \
    libreadline-dev \
    python-setuptools \ 
    libpcap-dev \
    tcpdump \
    build-essential \
    python-pip -y && \
    rm -rf /var/lib/apt/lists/*

RUN pip install pcappy

#RUN ln -s /usr/bin/python3 /usr/bin/python

RUN git clone https://github.com/cloudflare/bpftools.git bpftools

WORKDIR /opt/bpftools

RUN make


