FROM limed/ubuntu-base
MAINTAINER limed@sudoers.org

# Install dependencies
RUN apt-get update \
    && apt-get install -qy git libssl-dev gcc make g++ 

# Build simc
RUN git clone https://github.com/simulationcraft/simc \
    && cd simc \
    && make BITS=64 OPENSSL=1 -C engine \
    && mv /simc/engine/simc /usr/local/bin/simc \
    && cd / \
    && rm -fr /simc \
    && apt-get remove gcc g++ make \
    && apt-get clean -qy \
    && apt-get autoclean -qy \
    && apt-get autoremove -qy \
    && apt-get purge -qy \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && rm -rf /var/lib/{apt,dpkg,cache,log}

ENTRYPOINT [ "/usr/local/bin/simc" ]

