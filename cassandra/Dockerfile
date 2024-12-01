FROM cassandra:4.1
COPY cassandra-init.cql /init.cql
CMD ["sh", "-c", "cassandra -R && until cqlsh -f /init.cql; do sleep 5; done && tail -f /dev/null"]
