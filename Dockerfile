# Use TensorFlow base image (already includes Python and TF)
FROM tensorflow/tensorflow:2.14.0

# Avoid GUI issues with OpenCV
ENV DEBIAN_FRONTEND=noninteractive

# Set working directory
WORKDIR /app

# Copy files into container
COPY . .

# Install OpenGL libs for OpenCV to work
RUN apt-get update && apt-get install -y libgl1-mesa-glx libglib2.0-0 && rm -rf /var/lib/apt/lists/*

# Upgrade pip and install dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Run your script
CMD ["python", "garbage.py"]
