FROM debian:stretch

# fix apt
RUN apt-get update

# fix environment
RUN apt-get install -y locales tmux git vim
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
RUN locale-gen

CMD /bin/bash
