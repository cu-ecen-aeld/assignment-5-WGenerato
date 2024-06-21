# Use the original image as the base
FROM cuaesd/aesd-autotest:assignment5-buildroot

# Install bash (or any other necessary tools)
RUN apt-get update && apt-get install -y bash

# Set bash as the default shell
SHELL ["/bin/sh", "-c"]

# Ensure all other necessary dependencies are installed
RUN apt-get install -y sshpass

