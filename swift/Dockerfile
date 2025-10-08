ARG SWIFT_VERSION=6.1.3
FROM swift:${SWIFT_VERSION}-jammy-slim AS builder

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get install -yqq --no-install-recommends curl clang libpython2.7 libpython2.7-dev

COPY setup.sh /setup.sh
RUN /setup.sh && \
        rm -rf /setup.sh

FROM swift:${SWIFT_VERSION}-jammy-slim

COPY --from=builder /pkl-gen-swift /pkl-gen-swift
COPY --from=builder /usr/local/bin/pkl /usr/local/bin/pkl
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]