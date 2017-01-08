FROM pamtrak06/ubuntu16.04-apache2-python 
RUN apt-get update -y && apt-get install -y software-properties-common python-software-properties
RUN add-apt-repository ppa:ubuntugis/ppa && apt-get -y update
#RUN echo "deb http://ppa.launchpad.net/ubuntugis/ppa/ubuntu xenial main" >> /etc/apt/sources.list
#RUN echo "deb-src http://ppa.launchpad.net/ubuntugis/ppa/ubuntu xenial main" >> /etc/apt/sources.list
#RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 314DF160 
#RUN apt-get -y update

# not a root user
USER nobody

