
# Use an official Ubuntu as a parent image
FROM ubuntu:22.04

# Install necessary packages
RUN apt-get update && \
    apt-get install -y fortune-mod cowsay netcat-openbsd && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy the bash script into the container
COPY wisecow.sh .

# Make the script executable
RUN chmod +x wisecow.sh
ENV PATH="/usr/games:$PATH"

# Expose the port the app runs on
EXPOSE 4499

# Run the script
CMD ["/app/wisecow.sh"]
# CMD ["sleep", "infinity"]
