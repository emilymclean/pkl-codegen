FROM debian:trixie AS builder
ARG TOOL_VERSION=0.29.0

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get install -yqq --no-install-recommends curl ca-certificates

RUN curl -L "https://github.com/apple/pkl/releases/download/${TOOL_VERSION}/pkl-codegen-java" -o "/pkl-codegen-java"
RUN chmod +x "/pkl-codegen-java"

FROM eclipse-temurin:21-jre-ubi10-minimal

COPY --from=builder /pkl-codegen-java /pkl-codegen-java
# COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/__cacert_entrypoint.sh", "/pkl-codegen-java"]