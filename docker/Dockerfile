FROM frolvlad/alpine-glibc:alpine-3.9

ENV DENO_VERSION=0.7.0

COPY sshd_config /etc/ssh/
COPY init_container.sh /opt/startup/
COPY ssh_setup.sh /tmp
COPY default.ts /opt/startup/

RUN apk add --no-cache curl openssh-server && \
    curl -fsSL https://github.com/denoland/deno/releases/download/v${DENO_VERSION}/deno_linux_x64.gz --output deno.gz && \
    gunzip deno.gz && \
    chmod 777 deno && \
    mv deno /bin/deno && \
    apk del curl && \
    echo "root:Docker!" | chpasswd && \
    chmod -R +x /tmp/ssh_setup.sh && \
    chmod -R +x /opt/startup && \
    (sleep 1;/tmp/ssh_setup.sh 2>&1 > /dev/null) && \
    mkdir -p /home/site/wwwroot/ && \
    rm -rf /tmp/*

EXPOSE 2222

ENTRYPOINT ["/opt/startup/init_container.sh"]
