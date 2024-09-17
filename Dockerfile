FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y curl unzip procps && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y nodejs

RUN curl -fsSL https://code-server.dev/install.sh | sh

RUN echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.conf && \
    sysctl -p

EXPOSE 8080

CMD ["code-server", "--auth", "none", "--host", "0.0.0.0", "--bind-addr", "0.0.0.0:8080"]
