#!/bin/bash
# secondary-setup/teardown.sh

# Tear down the containers
podman-compose -f docker-compose.yml down
