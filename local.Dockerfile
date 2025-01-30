# Base image
FROM debian:bookworm-slim

# Install required packages
RUN apt-get update && apt-get install -y \
    ansible \
    openssh-client \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Create a directory for keys
RUN mkdir -p /app/keys

# Set environment variable for keys location
ENV SCRIPTS_DIR=/app/scripts

# Copy the SSH key generation script into the container
COPY ./scripts/generate_ssh_key $SCRIPTS_DIR/generate_ssh_key.sh
RUN chmod +x $SCRIPTS_DIR/generate_ssh_key.sh

# Set default working directory
WORKDIR /app