#!/bin/bash

# Connect Kafka brokers by updating their advertised listeners
source .env

# Add other brokers' URLs here
OTHER_BROKER_LISTENERS="OUTSIDE://<broker_1_ngrok_url>,OUTSIDE://<broker_2_ngrok_url>,OUTSIDE://<broker_3_ngrok_url>"

podman exec kafka kafka-server-start.sh \
  --override advertised.listeners=$OTHER_BROKER_LISTENERS
