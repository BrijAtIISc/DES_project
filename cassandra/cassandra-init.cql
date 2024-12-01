-- Create a keyspace
CREATE KEYSPACE IF NOT EXISTS test_keyspace 
WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1};

-- Use the keyspace
USE test_keyspace;

-- Create a table
CREATE TABLE IF NOT EXISTS users (
    id UUID PRIMARY KEY,
    name text,
    email text,
    created_at timestamp
);
