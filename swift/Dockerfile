FROM ubuntu:22.04

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get install -yqq curl clang libpython2.7 libpython2.7-dev
RUN curl -L https://download.swift.org/swift-5.10-release/ubuntu2204/swift-5.10-RELEASE/swift-5.10-RELEASE-ubuntu22.04.tar.gz -o swift.tar.gz && \
        tar xzf swift.tar.gz && \
        mv swift-5.10-RELEASE-ubuntu22.04 /usr/share/swift

RUN curl -L -o /pkl https://github.com/apple/pkl/releases/download/0.26.3/pkl-linux-amd64 && \
        chmod +x /pkl && \
        mv pkl /usr/share/swift/usr/bin/pkl

RUN curl -L https://github.com/apple/pkl-swift/releases/download/0.2.1/pkl-gen-swift-linux-amd64.bin -o /pkl-gen-swift && \
        chmod +x /pkl-gen-swift

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]