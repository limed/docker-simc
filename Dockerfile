FROM limed/ubuntu-base
MAINTAINER limed@sudoers.org

# Install dependencies
RUN apt-get update \
    && apt-get install -qy git libssl-dev gcc make g++ \
    && apt-get clean -y \
    && apt-get autoclean -y \
    && apt-get autoremove -y \
    && apt-get purge -y \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && rm -rf /var/lib/{apt,dpkg,cache,log}

# Build simc
RUN git clone https://github.com/simulationcraft/simc \
    && cd simc/engine \
    && make OPENSSL=1 optimized \
    && mv /simc/engine/simc /usr/local/bin/simc \
    && cd / \
    && rm -fr /simc

ENTRYPOINT [ "/usr/local/bin/simc" ]

