#syntax=docker/dockerfile:1.2
FROM alpine:3.13.5 as gh

WORKDIR /

RUN apk add --no-cache git libc6-compat wget rsync && \
    wget https://github.com/cli/cli/releases/download/v1.10.3/gh_1.10.3_linux_amd64.tar.gz && \
    tar -zxvf gh_1.10.3_linux_amd64.tar.gz && \
    chmod +x gh_1.10.3_linux_amd64/bin/gh && \
    rsync -az --remove-source-files gh_1.10.3_linux_amd64/bin/ /usr/local/bin && \
    rm -rf gh_1.10.3_linux_amd64 && \
    apk del wget rsync && \
    gh version

ENTRYPOINT ["/usr/local/bin/gh"]