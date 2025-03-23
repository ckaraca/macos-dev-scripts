#!/bin/bash

# Check for Docker
if ! command -v docker &> /dev/null; then
    echo "Docker is required but not found. Install Docker Desktop."
    exit 1
fi

# Validate input
if [ -z "$1" ]; then
    echo "Usage: $0 <repo_name> [port]"
    exit 1
fi

# Variables
REPO_NAME=$1
CONTAINER_NAME="Pluggedin_${REPO_NAME}"
DB_NAME="pluggedin_${REPO_NAME}_db"
DB_USER="pluggedin_user"
DB_PASSWORD="strongpassword"  # Change as needed

# Use provided port or default to 5432
HOST_PORT=${2:-5432}

# Check if container exists and remove if it does
if [ "$(docker ps -aq -f name=${CONTAINER_NAME})" ]; then
    echo "Container ${CONTAINER_NAME} exists. Removing it."
    docker stop ${CONTAINER_NAME}
    docker rm ${CONTAINER_NAME}
fi

# Launch PostgreSQL Docker container
docker run -d \
    --name ${CONTAINER_NAME} \
    -e POSTGRES_DB=${DB_NAME} \
    -e POSTGRES_USER=${DB_USER} \
    -e POSTGRES_PASSWORD=${DB_PASSWORD} \
    -p ${HOST_PORT}:5432 \
    -v ${CONTAINER_NAME}_data:/var/lib/postgresql/data \
    postgres:latest

# Confirmation Output
echo "✅ PostgreSQL container '${CONTAINER_NAME}' started successfully."
echo "📌 Database: ${DB_NAME}"
echo "👤 User: ${DB_USER}"
echo "🔑 Password: ${DB_PASSWORD}"
echo "🌐 Port: ${HOST_PORT}"
