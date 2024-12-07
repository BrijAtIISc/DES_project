import os
import sys
import json
import time
import uuid
import settings as S
from datetime import datetime
from kafka import KafkaProducer

def create_producer():
  """
  Create a Kafka producer instance.
  """
  try:
    producer = KafkaProducer(
      bootstrap_servers=S.KAFKA_SERVERS,
      value_serializer=lambda v: json.dumps(v).encode('utf-8'),
    )
    print("Kafka producer created successfully!")
    return producer
  except Exception as e:
    print(f"Failed to create Kafka producer: {e}")
    sys.exit(1)


def get_message():
  """
  Generate a message to be sent to the Kafka topic.
  """
  data = {
    'id': str(uuid.uuid4()),
    'time': datetime.now().isoformat(),
    'hostname': os.uname().nodename,
    'process_id': os.getpid(),
    'message': "Hello, Kafka!"
  }
  print(f"Message generated: {data}")
  return data


def send_message(producer, topic, message):
  """
  Send a message to the specified Kafka topic.
  """
  future = producer.send(topic, message)
  result = future.get(timeout=10)  # Wait for confirmation
  print(f"Message sent to topic '{topic}': {result}")


if __name__ == "__main__":
  producer = create_producer()
  try:
    while True:
      message = get_message()
      send_message(producer, S.TOPIC_NAME, message)
      time.sleep(5)
  except KeyboardInterrupt:
    producer.close()
    print("Kafka producer closed.")
