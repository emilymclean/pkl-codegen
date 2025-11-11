FROM debian:trixie AS builder
ARG TOOL_VERSION=0.29.0

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get install -yqq --no-install-recommends curl ca-certificates

RUN curl -L "https://github.com/apple/pkl/releases/download/${TOOL_VERSION}/jpkl" -o "/jpkl"
RUN chmod +x "/jpkl"

FROM eclipse-temurin:21-jre-ubi10-minimal

COPY --from=builder /jpkl /jpkl
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/__cacert_entrypoint.sh", "/entrypoint.sh"]