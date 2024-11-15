#!/bin/bash

echo "Starting Kafka cluster using Podman..."
podman-compose -f docker-compose.yml up -d

echo "Starting Ngrok to expose Kafka..."
ngrok tcp 9092 &

echo "Kafka is now publicly accessible via Ngrok."
