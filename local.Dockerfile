FROM debian:bookworm-slim

SHELL ["/bin/bash", "-euo", "pipefail", "-c"]

RUN apt-get update && apt-get install -y \
    ansible         \
    openssh-client  \
    curl            \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN curl -L https://fly.io/install.sh | sh
ENV FLYCTL_INSTALL=/root/.fly
ENV PATH=${FLYCTL_INSTALL}/bin:$PATH

RUN mkdir -p /app/keys

ENV SCRIPTS_DIR=/app/scripts
COPY ./scripts/generate_ssh_key $SCRIPTS_DIR/generate_ssh_key.sh
RUN chmod +x $SCRIPTS_DIR/generate_ssh_key.sh

WORKDIR /app