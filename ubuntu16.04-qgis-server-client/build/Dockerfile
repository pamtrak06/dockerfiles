FROM pamtrak06/ubuntu16.04-qgis-server
USER root
RUN apt-get update -y && \
    apt-get install -y git software-properties-common
# remove python 2.7 and install python 3.5
RUN apt purge -y --auto-remove python2.7-minimal && \
    apt-get install -y idle-python3.4
# remove php7
RUN apt-get purge `dpkg -l | grep php| awk '{print $2}' |tr "\n" " "`
# install php5
RUN apt-get install -y language-pack-en-base && \
    export LC_ALL=en_US.UTF-8 && \
    export LANG=en_US.UTF-8 && \
    add-apt-repository -y ppa:ondrej/php5-5.6 && \
    #add-apt-repository -y ppa:ondrej/mariadb-10.0 &&  \
    apt-get update &&  \
    apt-get -y upgrade &&  \
    apt-get install -y php5.6 php5.6-cli php5.6-xml php5.6-mbstring php5.6-mcrypt php5.6-mysql

RUN git clone https://github.com/qgis/qgis-web-client.git
WORKDIR /qgis-web-client
#RUN ./install.sh
# not a root user
USER nobody
