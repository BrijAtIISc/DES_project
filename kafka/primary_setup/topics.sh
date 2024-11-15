#!/bin/bash
# primary-setup/topic-setup.sh

# Example to create a topic named 'my_topic'
TOPIC_NAME="my_topic"
PARTITIONS=3
REPLICATION_FACTOR=2  # Adjust as needed

podman exec kafka kafka-topics.sh --create \
    --zookeeper localhost:2181 \
    --replication-factor $REPLICATION_FACTOR \
    --partitions $PARTITIONS \
    --topic $TOPIC_NAME
