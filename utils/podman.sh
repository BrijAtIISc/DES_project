#!/bin/bash

# Check if Homebrew is installed
if ! command -v brew &> /dev/null
then
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew is already installed."
fi

# Update Homebrew
echo "Updating Homebrew..."
brew update

# Install Podman
echo "Installing Podman..."
brew install podman

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
