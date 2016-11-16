FROM gitlab/dind
RUN apt-get -y update && apt-get install -y bc zip unzip wget curl git gettext
WORKDIR /usr/local/bin
RUN git clone https://github.com/pamtrak06/edocker.git
WORKDIR /usr/local/bin/edocker
RUN chmod 755 scripts/*.sh; chmod 755 edockerinstall.sh
RUN ./edockerinstall.sh
RUN git clone --branch=master https://github.com/sstephenson/bats.git /tmp/bats
RUN cd /tmp/bats; ./install.sh /usr/local; rm -rf /tmp/bats
CMD [ "run_tests.sh" ]
