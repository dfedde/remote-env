FROM ubuntu:14.04
MAINTAINER duncan@fedde.us

# Let's start with some basic stuff.
RUN apt-get update -qq && apt-get install -qqy \
    apt-transport-https \
    ca-certificates \
    curl \
    lxc \
    iptables \
    openssh-server

# Install Docker from Docker Inc. repositories.
RUN curl -sSL https://get.docker.com/ubuntu/ | sh

# Install the magic wrapper.
ADD ./wrapdocker /usr/local/bin/wrapdocker
RUN chmod +x /usr/local/bin/wrapdocker

ADD ./remote-env /bin/remote-env
RUN chmod +x /bin/remote-env

# Define additional metadata for our image.
VOLUME /var/lib/docker
CMD ["wrapdocker"]

