# Use the original image as the base
FROM cuaesd/aesd-autotest:assignment5-buildroot

# Install bash (or any other necessary tools)
RUN apt-get update && apt-get install -y bash

# Ensure all other necessary dependencies are installed
RUN apt-get install -y sshpass

