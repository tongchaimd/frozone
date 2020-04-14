FROM debian
WORKDIR /
RUN apt-get update
RUN apt-get install -y sudo
RUN apt-get install -y build-essential
RUN apt-get install -y vim
RUN apt-get install -y httpie
RUN apt-get install -y curl
RUN apt-get install -y git
RUN apt-get install -y wget
RUN (mkdir -p ~/bin; curl -o ~/bin/tldr https://raw.githubusercontent.com/raylee/tldr/master/tldr; chmod +x ~/bin/tldr)
RUN /bin/bash -c '(cd /tmp; wget https://github.com/libevent/libevent/releases/download/release-2.1.11-stable/libevent-2.1.11-stable.tar.gz; tar -xzf libevent-2.1.11-stable.tar.gz; cd libevent-2.1.11-stable; ./configure --prefix=/usr --disable-static; make; sudo make install; cd /tmp; wget https://ftp.gnu.org/pub/gnu/ncurses/ncurses-6.1.tar.gz; tar -xzf ncurses-6.1.tar.gz; cd ncurses-6.1; ./configure --prefix=/usr; make; sudo make install; cd /tmp; wget https://github.com/tmux/tmux/releases/download/2.9a/tmux-2.9a.tar.gz; tar -xzf tmux-2.9a.tar.gz; cd tmux-2.9a; ./configure; make; sudo make install)'
COPY . /super-suit
ENTRYPOINT ["/bin/bash"]
