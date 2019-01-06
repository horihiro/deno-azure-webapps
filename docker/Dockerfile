FROM hayd/deno:alpine-0.2.5

# ------------------------
# SSH Server support
# ------------------------
RUN apk update\
  && apk add --no-cache openssh-server \
  && echo "root:Docker!" | chpasswd

COPY sshd_config /etc/ssh/
COPY init_container.sh /opt/startup/
COPY ssh_setup.sh /tmp
RUN chmod -R +x /tmp/ssh_setup.sh \
  && chmod -R +x /opt/startup \
  && (sleep 1;/tmp/ssh_setup.sh 2>&1 > /dev/null) \
  && rm -rf /tmp/*

EXPOSE 2222

ENTRYPOINT ["/opt/startup/init_container.sh"]
