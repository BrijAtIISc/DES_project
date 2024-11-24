KAFKA_SERVERS = []
TOPIC_NAME = "example-topic"

# ----------------------------------------------------------------------

# Local overrides
try:
    from local_settings import *  # noqa
except ImportError:
    pass
