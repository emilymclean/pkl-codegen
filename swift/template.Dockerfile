FROM ubuntu:22.04

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get install -yqq curl clang libpython2.7 libpython2.7-dev
RUN curl -L https://download.swift.org/swift-5.10-release/ubuntu2204/swift-5.10-RELEASE/swift-5.10-RELEASE-ubuntu22.04.tar.gz -o swift.tar.gz && \
        tar xzf swift.tar.gz && \
        mv swift-5.10-RELEASE-ubuntu22.04 /usr/share/swift

COPY setup.sh /setup.sh
RUN setup.sh && \
        rm -rf /setup.sh

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]