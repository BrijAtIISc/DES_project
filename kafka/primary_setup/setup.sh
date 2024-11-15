#!/bin/bash
# primary-setup/setup.sh

# Load environment variables
source env.primary

# Start Zookeeper and Kafka using docker-compose
podman-compose -f docker-compose.yml up -d
