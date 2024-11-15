#!/bin/bash
echo "Stopping Kafka cluster..."
podman-compose -f docker-compose.yml down

echo "Stopping Ngrok..."
pkill ngrok
