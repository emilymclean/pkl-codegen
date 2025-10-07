FROM swift:6.1.3-jammy-slim

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get install -yqq curl clang libpython2.7 libpython2.7-dev

COPY setup.sh /setup.sh
RUN /setup.sh && \
        rm -rf /setup.sh

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]