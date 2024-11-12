FROM ubuntu:22.04

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get install -yqq curl clang libpython2.7 libpython2.7-dev
RUN curl -L https://download.swift.org/swift-5.10-release/ubuntu2204/swift-5.10-RELEASE/swift-5.10-RELEASE-ubuntu22.04.tar.gz -o swift.tar.gz && \
        tar xzf swift.tar.gz && \
        mv swift-5.10-RELEASE-ubuntu22.04 /usr/share/swift

RUN /bin/bash -c 'set -ex && \
    if [ "$(uname -m)" == "x86_64" ]; then \
            ARCH="amd64" \
    else \
            ARCH="aarch64" \
    fi \
    echo "ARCH=$ARCH" && \
    curl -L -o /pkl https://github.com/apple/pkl/releases/download/{{{ env.pkl_version }}}/pkl-linux-$ARCH && \
    chmod +x /pkl && \
    mv pkl /usr/share/swift/usr/bin/pkl && \
    curl -L https://github.com/apple/pkl-swift/releases/download/{{{ env.swift_tool_version }}}/pkl-gen-swift-linux-$ARCH.bin -o /pkl-gen-swift && \
    chmod +x /pkl-gen-swift'

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]