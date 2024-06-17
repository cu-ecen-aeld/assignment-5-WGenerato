# base_external/external.mk

BR2_EXTERNAL_PACKAGES += aesd-assignments

# Include the package makefile with relative path
include $(BR2_EXTERNAL)/package/aesd-assignments/aesd-assignments.mk

# Add the defconfig file to the configuration path
BR2_DEFCONFIG = $(BR2_EXTERNAL)/configs/aesd_qemu_defconfig

# Ensure the Config.in is included
source $(BR2_EXTERNAL)/package/aesd-assignments/Config.in

