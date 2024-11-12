FROM ubuntu:22.04

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get install -yqq software-properties-common
RUN add-apt-repository -y ppa:longsleep/golang-backports
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get install -yqq curl golang-go

RUN /bin/bash -c 'set -ex && \
    if [ "$(uname -m)" == "x86_64" ]; then \
       ARCH="amd64"\
    else \
       ARCH="aarch64" && \
    fi \
    echo "ARCH=$ARCH" && \
    curl -L -o /pkl https://github.com/apple/pkl/releases/download/{{{ env.pkl_version }}}/pkl-linux-$ARCH && \
    chmod +x /pkl && \
    mv /pkl /usr/local/bin/pkl'

RUN go install github.com/apple/pkl-go/cmd/pkl-gen-go@v{{{ env.go_tool_version }}}

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]