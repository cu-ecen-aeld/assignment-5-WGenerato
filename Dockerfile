# Stage 1: Build Stage
FROM cuaesd/aesd-autotest:assignment5-buildroot AS build

# Install bash and sshpass for build and setup purposes
RUN apt-get update \
    && apt-get install -y bash sshpass \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set bash as the default shell
SHELL ["/bin/bash", "-c"]

# Additional build steps as needed

# Stage 2: Final Stage
FROM cuaesd/aesd-autotest:assignment5-buildroot

# Copy artifacts from the build stage, if any
COPY --from=build /path/to/artifacts /app

# Optionally, copy scripts or configuration files

# Set the default command for the container
CMD ["bash"]

