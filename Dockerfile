FROM ubuntu:14.04

RUN apt-get update&&\
    apt-get upgrade -y &&\
    apt-get install -y openssh-server &&\
    apt-get clean&&\
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir /var/run/sshd && \
    sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \ 
    sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

COPY start /usr/sbin/start 
RUN chmod +x /usr/sbin/start
EXPOSE 22

ENTRYPOINT ["/usr/sbin/start"]


