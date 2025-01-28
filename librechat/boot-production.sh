#!/bin/bash

# Create network if it does not exist.
../create-llm-network.sh

docker compose -f compose.yml -f compose.prod.yml up -d