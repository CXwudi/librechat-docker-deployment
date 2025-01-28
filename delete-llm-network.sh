#!/bin/bash

# Define the network name
NETWORK_NAME="llm-http-global-network"

# Check if the network already exists
if [ "$(docker network ls --filter name=^${NETWORK_NAME}$ --format="{{ .Name }}")" = "${NETWORK_NAME}" ]; then
  echo "Removing network '${NETWORK_NAME}."
  docker network rm ${NETWORK_NAME}
else
  echo "Network did not exist."
fi