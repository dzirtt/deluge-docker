FROM debian:jessie

#add to start script or compose to set login:pass
#ENV LOGIN
#ENV PASSWORD

ENV DEBIAN_FRONTEND noninteractive

ENV DELUGE_CONFIG_DIR /home/deluge/config
ENV DELUGE_DATA_DIR /home/deluge/data

# Install components
RUN apt-get update 
RUN apt-get --no-install-recommends -qyy install sudo deluged deluge-console \
                                                 runit unzip wget zip

#for debug purpose
RUN apt-get -qyy install nano lsof 
    
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN useradd -m -s /bin/nologin deluge
RUN mkdir -p ${DELUGE_DATA_DIR} ${DELUGE_CONFIG_DIR} ${DELUGE_DATA_DIR}/autoadd

#copy predefined config files
ADD core.conf ${DELUGE_CONFIG_DIR}/
ADD blocklist.conf ${DELUGE_CONFIG_DIR}/

# Expose ports
EXPOSE 11961
EXPOSE 1113

VOLUME ${DELUGE_CONFIG_DIR}
VOLUME ${DELUGE_DATA_DIR}

ADD entrypoint.sh /home/deluge
RUN chmod +x /home/deluge/entrypoint.sh

ENTRYPOINT ["/bin/bash"]
CMD ["/home/deluge/entrypoint.sh"]
