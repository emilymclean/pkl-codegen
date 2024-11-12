FROM ubuntu:22.04

RUN apt-get update
RUN add-apt-repository -y ppa:longsleep/golang-backports
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get install -yqq curl golang-go

RUN curl -L -o /pkl https://github.com/apple/pkl/releases/download/{{{ env.pkl_version }}}/pkl-linux-amd64 && \
        chmod +x /pkl && \
        mv pkl /usr/share/swift/usr/bin/pkl

RUN go install github.com/apple/pkl-go/cmd/pkl-gen-go@v{{{ env.go_tool_version }}}

ENTRYPOINT ["pkl-gen-go"]