# Use Python base image
FROM python:3.10

# Avoid GUI issues with OpenCV
ENV DEBIAN_FRONTEND=noninteractive
# Use TensorFlow's official image
FROM tensorflow/tensorflow:2.14.0

# Set working directory inside the container
WORKDIR /app

# Copy all files into the container
COPY . .

# Install OpenGL libraries needed for OpenCV
RUN apt-get update && apt-get install -y libgl1-mesa-glx

# Install Python libraries
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Run the Python script when the container starts
CMD ["python", "garbage.py"]
