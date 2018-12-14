FROM tensorflow/tensorflow:latest-gpu

# install ifconfig
RUN apt-get update \
	&& apt-get install nano \
	&& apt-get install -y openssh-server \
    && mkdir /var/run/sshd \
	&& sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
	&&  sed -i 's/#PasswordAuthentication/PasswordAuthentication/' /etc/ssh/sshd_config 



# solve encoding error for chinese
ENV LANG C.UTF-8

ENTRYPOINT service ssh restart && bash