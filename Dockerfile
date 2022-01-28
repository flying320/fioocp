FROM alpine

# add openssh and fio
RUN apk add fio openssh openrc bash sudo


#Enable the sshd service so that it starts at boot: 
RUN rc-update add sshd default

#Enable public key authentication
RUN echo 'PubkeyAuthentication yes' >> /etc/ssh/sshd_config


#Add user 
RUN adduser -h /home/ddanner -s /bin/sh -D ddanner
RUN mkdir -m 700 /home/ddanner/.ssh  

# Copy public key
COPY id_rsa.pub /home/ddanner/.ssh/authoriyed_keys

EXPOSE 22
CMD ["/etc/init.d/sshd start"]

COPY runfio.sh /home/ddanner/runfio.sh 
WORKDIR /fioconf
