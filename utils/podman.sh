#!/bin/bash

# Check if Podman is installed
if ! command -v podman &> /dev/null; then
  echo "Podman not found. Installing Podman..."
  # Check if Homebrew is installed
  if ! command -v brew &> /dev/null; then
    echo "Homebrew not found. Please install Homebrew to continue."
    exit 1
  fi
  # Install Podman
  echo "Installing Podman..."
  brew install podman
else
  echo "Podman is already installed."
fi

# Check if podman-compose is installed
if ! command -v podman-compose &> /dev/null; then
  echo "podman-compose not found. Installing podman-compose..."
  # Check if pip is installed
  if ! command -v pip &> /dev/null; then
    echo "pip not found. Please install pip to continue."
    exit 1
  fi
  # Install podman-compose
  pip install podman-compose
else
  echo "podman-compose is already installed."
fi

# Initialize Podman
echo "Initializing Podman..."
podman machine init

# Start Podman machine
echo "Starting Podman machine..."
podman machine start

# Validate the installation
echo "Validating Podman installation..."
podman --version

# Run a test container
echo "Running a test container..."
podman run hello-world

# Check the status of the test container
if [ $? -eq 0 ]; then
  echo "Podman installation and validation successful!"
else
  echo "Podman installation or validation failed."
fi
