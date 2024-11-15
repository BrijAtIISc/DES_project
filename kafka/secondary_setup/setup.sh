#!/bin/bash
# secondary-setup/setup.sh

# Load environment variables
source env.secondary

# Start Kafka using docker-compose
podman-compose -f docker-compose.yml up -d
