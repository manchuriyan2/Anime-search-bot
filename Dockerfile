# Use the official Python 3.9 image from the Docker Hub
FROM python:3.9.7-slim-buster

# Set the working directory inside the container
WORKDIR /app

# Install system dependencies and build tools required for compiling Python packages
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip, setuptools, and wheel to the latest versions
RUN pip install --upgrade pip setuptools wheel

# Copy the requirements file to the container
COPY requirements.txt .

# Install Python dependencies specified in requirements.txt
RUN pip install -r requirements.txt

# Copy the rest of the application code to the container
COPY . .

# Define the command to run the application
CMD ["python3", "main.py"]
