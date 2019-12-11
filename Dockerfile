FROM debian:unstable-slim

RUN apt-get update \
    && apt-get dist-upgrade -y \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    traceroute curl wget dnsutils jq nmap ncat net-tools tcpdump mtr-tiny iperf3 \
    git iproute2 siege apache2-utils openssl openssh-client nvi less tshark iptables \
    procps strace inetutils-ping inetutils-telnet inetutils-ftp kmod iptraf-ng

RUN apt-get install -y python3 python3-pip python3-setuptools python3-distutils --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

COPY Dockerfile /Dockerfile

LABEL org.label-schema.docker.dockerfile="/Dockerfile" \
      org.label-schema.vcs-type="Git" \
      org.label-schema.vcs-url="https://github.com/daniloegea/docker-tools"

