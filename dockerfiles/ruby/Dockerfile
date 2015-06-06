FROM ruby:2

MAINTAINER Duncan Fedde "https://github.com/dfedde"


# Install editors and tmux
RUN apt-get update
RUN apt-get install -y --force-yes tmux vim nano emacs
RUN apt-get clean

COPY runner /bin/runner

RUN chmod +x /bin/runner

