FROM ubuntu

ADD entrypoint.sh /opt/entrypoint.sh

RUN apt-get update -y && \
    apt-get install -y wget && \
    apt-get install -y openssh-server && \
    echo "PermitRootLogin yes\nUsePAM no" > /etc/ssh/sshd_config.d/sshd.conf && \
    wget https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb && \
    dpkg -i cloudflared-linux-amd64.deb && \
    chmod +x /opt/entrypoint.sh

ENTRYPOINT ["/opt/entrypoint.sh"]