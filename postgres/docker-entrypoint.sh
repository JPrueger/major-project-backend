#!/bin/bash

set -o errexit
set -e
set -u

main() {
  init_db
}

init_db() {
  echo "Creating database"
  psql -v ON_ERROR_STOP=1 --username $POSTGRES_USER <<-EOSQL
    CREATE SCHEMA graphql;
    CREATE TABLE IF NOT EXISTS graphql.todos (
      id SERIAL PRIMARY KEY,
      title TEXT,
      description TEXT,
      is_complete BOOLEAN,
      created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
      updated_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );
    INSERT INTO graphql.todos (title, description, is_complete) VALUES
    ('Parent name 1', 'Parent description 1', False),
    ('Parent name 2', 'Parent description 2', False),
    ('Parent name 3', 'Parent description 3', False);
EOSQL
  echo "Successfully created database"
}

main "$@"
