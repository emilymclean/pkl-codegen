FROM golang:1.25.5-trixie AS builder

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get install -yqq curl

COPY setup.sh /setup.sh
RUN /setup.sh && \
        rm -rf /setup.sh

FROM golang:1.25.5-trixie

COPY --from=builder /usr/local/bin/pkl /usr/local/bin/pkl

RUN go install github.com/apple/pkl-go/cmd/pkl-gen-go@v{{{ env.go_tool_version }}}

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
