#!/bin/bash

echo "Exporting all files as .txt files in started..."

# Check if the directory argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <directory>"
  exit 1
fi

# Set the target directory
SOURCE_DIR="$1"

echo "Exporting all files as .txt files in '$SOURCE_DIR'."

# Check if the directory exists
if [ ! -d "$SOURCE_DIR" ]; then
  echo "Error: Directory '$SOURCE_DIR' does not exist."
  exit 1
fi

# Create the 'exports' directory if it doesn't exist
EXPORT_DIR="${SOURCE_DIR}/exports"
mkdir -p "$EXPORT_DIR"

# Loop through each file in the source directory
for file in "$SOURCE_DIR"/*; do
  # Skip if it's a directory
  if [ -d "$file" ]; then
    continue
  fi

  # Get the filename without the path and extension
  filename=$(basename "$file")
  filename_no_ext="${filename%.*}"

  # Copy the file content to a new .txt file in the 'exports' directory
  cp "$file" "${EXPORT_DIR}/${filename_no_ext}.txt"
done

echo "All files have been saved as .txt files in '$EXPORT_DIR'."
