#!/bin/bash

# Define the network name
NETWORK_NAME="llm-http-global-network"

# Check if the network already exists
if [ "$(docker network ls --filter name=^${NETWORK_NAME}$ --format="{{ .Name }}")" = "${NETWORK_NAME}" ]; then
  echo "Network '${NETWORK_NAME}' already exists."
else
  # Create the network if it doesn't exist
  docker network create -d bridge ${NETWORK_NAME}
  echo "Network '${NETWORK_NAME}' created."
fi

