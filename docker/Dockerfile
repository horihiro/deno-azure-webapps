FROM frolvlad/alpine-glibc:alpine-3.9

ENV DENO_VERSION=0.20.0

COPY . /tmp

# COPY sshd_config /etc/ssh/
# COPY ssh_setup.sh /tmp
# COPY default.ts /opt/startup/
# COPY init_container.sh /opt/startup/

RUN mkdir -p /etc/ssh/ /opt/startup/ /home/site/wwwroot/ && \
    mv /tmp/sshd_config /etc/ssh/ && \
    mv /tmp/default.ts /opt/startup/ && \
    mv /tmp/init_container.sh /opt/startup/ && \
    apk add --no-cache curl openssh-server && \
    curl -fsSL https://github.com/denoland/deno/releases/download/v${DENO_VERSION}/deno_linux_x64.gz --output deno.gz && \
    gunzip deno.gz && \
    chmod 777 deno && \
    mv deno /bin/deno && \
    apk del curl && \
    echo "root:Docker!" | chpasswd && \
    chmod -R +x /tmp/ssh_setup.sh && \
    chmod -R +x /opt/startup && \
    (sleep 1;/tmp/ssh_setup.sh 2>&1 > /dev/null) && \
    rm -rf /tmp/*

EXPOSE 2222

ENTRYPOINT ["/opt/startup/init_container.sh"]
