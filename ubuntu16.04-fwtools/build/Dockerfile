FROM pamtrak06/ubuntu16.04-apache2-python 

RUN apt-get update; apt-get install -y wget
RUN wget http://fwtools.loskot.net/FWTools-linux-2.0.6.tar.gz
RUN tar -xvf /FWTools-linux-2.0.6.tar.gz
RUN rm /FWTools-2.0.6/install.sh
ADD install.sh /FWTools-2.0.6/
RUN cd FWTools-2.0.6; ./install.sh

ENV PATH=$PATH:/FWTools-linux-2.0.6/bin_safe
WORKDIR /FWTools-2.0.6/bin_safe

# not a root user
USER nobody

