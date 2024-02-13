# LibreChat Docker Deployment

Although [the official docker compose deployment guide](https://docs.librechat.ai/install/installation/docker_compose_install.html) from LibreChat documenetation is enough for everyone, I would like to share my own way of deploying LibreChat using Docker and Docker Compose

## Features

- Using the official [prebuilt image](https://github.com/danny-avila?tab=packages&repo_name=LibreChat) to avoid running `docker build` command
- Already provided configuration of OpenAI, Gemini, Mistral, OpenRouter, BingAI, DALLE. Just put yout API key in the `all-api-key.env` file and you are good to go
- Enforced mongodb protection through the creation of separate database with a separate username and passwords.
- Separate environment files for different sections of the configuration, allowing for better environment management.
- An external Docker bridge network for configuring access to other self-hosted LLM providers (`copilot-gpt4-service` in this case).
- Different profiles for local and production environments, with a common base `compose.yml`.

## Prerequisites

Before you begin, ensure you have the following installed:

- Docker
- Docker Compose

## Setup

Follow these steps to get your development environment set up:

1. Clone this repository or download the ZIP file.
2. Navigate to the project directory.
3. Fill in your API keys in the `all-api-key.env` file.
4. (Optional but highly recommended for the best practice of security) Complete all the `# TODO` in [`librechat/env`](librechat/env/)

## Usage

### Setting up the Network

First, run the `create-llm-network.sh` script to create an external bridge network. This network will be used by both `librechat` and `copilot-gpt4-service`. The network is declared as an external bridge network in both `compose.yml` files.

```
./create-llm-network.sh
```

### Local Environment

For local debugging, use the `boot-local.sh` and `shutdown-local.sh` scripts. These scripts use the `compose.local.yml` file and expose the necessary ports for local debugging.

To start the service:

```
./boot-local.sh
```

To shutdown the service:

```
./shutdown-local.sh
```

### Production Environment

In a production environment, use the `boot-production.sh` and `shutdown-production.sh` scripts. These scripts use the `compose.prod.yml` file.

To start the service:

```
./boot-production.sh
```

To shutdown the service:

```
./shutdown-production.sh
```
