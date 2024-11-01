#!/bin/bash

# Define the new directory structure
BASE_DIR="Development_Standards"
SDLC_DIR="$BASE_DIR/SDLC_Standards"
CI_CD_DIR="$BASE_DIR/CI_CD_Pipeline_Standards"

# Create the directories
mkdir -p "$SDLC_DIR" "$CI_CD_DIR"

# Create README.md files in each directory
echo "# SDLC Standards" > "$SDLC_DIR/README.md"
echo "This directory contains the Software Development Life Cycle (SDLC) standards and guidelines." >> "$SDLC_DIR/README.md"

echo "# CI/CD Pipeline Standards" > "$CI_CD_DIR/README.md"
echo "This directory contains the Continuous Integration and Continuous Deployment (CI/CD) pipeline standards and practices." >> "$CI_CD_DIR/README.md"

# Print success message
echo "Development_Standards directory created with SDLC and CI/CD subdirectories, including README.md files."
