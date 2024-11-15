#!/bin/bash

# Set variables for topic name and group name
TOPIC_NAME="my_topic"
GROUP_NAME="my_consumer_group"
PARTITIONS=3
REPLICATION_FACTOR=1

# Create a Kafka topic
echo "Creating topic $TOPIC_NAME..."
podman exec kafka kafka-topics.sh --create \
  --zookeeper zookeeper:2181 \
  --replication-factor $REPLICATION_FACTOR \
  --partitions $PARTITIONS \
  --topic $TOPIC_NAME

# List all topics
echo "Listing all topics..."
podman exec kafka kafka-topics.sh --list --zookeeper zookeeper:2181

# Start a consumer in the specified group (for testing)
echo "Starting a consumer in group $GROUP_NAME..."
podman exec -d kafka kafka-console-consumer.sh --bootstrap-server localhost:9092 \
  --topic $TOPIC_NAME \
  --group $GROUP_NAME
