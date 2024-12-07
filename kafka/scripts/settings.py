KAFKA_SERVERS = []
TOPIC_NAME = "example-topic"
GROUP_ID = "example-group1"

# ----------------------------------------------------------------------

# Local overrides
try:
    from local_settings import *  # noqa
except ImportError:
    pass
