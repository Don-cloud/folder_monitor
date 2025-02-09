# Use a lightweight Debian-based Linux as the base image
# Debian Slim is chosen for its balance of size and compatibility
FROM debian:bullseye-slim

# Set a maintainer label
# This label specifies the maintainer's contact information for the image
LABEL maintainer="you@example.com"

# Install necessary packages
# Update the package list and install inotify-tools and inoticoming for file system event monitoring
RUN apt-get update && apt-get install -y --no-install-recommends \
    inotify-tools inoticoming \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY ./handler.sh /handler.sh
RUN chmod +x ./handler.sh
COPY ./monitor.sh /monitor.sh
RUN chmod +x ./monitor.sh
WORKDIR /

CMD while true; do \
    echo "Hello"; \
    sleep 1800; \
done
