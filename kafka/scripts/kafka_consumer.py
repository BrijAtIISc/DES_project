import os
import sys
import json
import settings as S
from kafka import KafkaConsumer

def create_consumer():
    """
    Create a Kafka consumer instance.
    """
    try:
        consumer = KafkaConsumer(
            S.TOPIC_NAME,
            bootstrap_servers=S.KAFKA_SERVERS,
            value_deserializer=lambda v: json.loads(v.decode('utf-8')),
            group_id=S.GROUP_ID,
            auto_offset_reset='earliest',  # Start reading at the earliest message
            enable_auto_commit=True
        )
        print("Kafka consumer created successfully!")
        return consumer
    except Exception as e:
        print(f"Failed to create Kafka consumer: {e}")
        sys.exit(1)

def process_message(message):
    """
    Process a single message consumed from the Kafka topic.
    """
    try:
        data = message.value
        print(f"Message received: {data}")
        # Add your message processing logic here
    except Exception as e:
        print(f"Failed to process message: {e}")

if __name__ == "__main__":
    consumer = create_consumer()
    try:
        for message in consumer:
            process_message(message)
    except KeyboardInterrupt:
        consumer.close()
        print("Kafka consumer closed.")
