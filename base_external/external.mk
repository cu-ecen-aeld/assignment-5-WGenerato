# base_external/external.mk
BR2_EXTERNAL_PACKAGES += aesd-assignments

# Include the package makefile with a relative path
include $(BR2_EXTERNAL)/package/aesd-assignments/aesd-assignments.mk

# Add the defconfig file to the configuration path
BR2_DEFCONFIG = $(BR2_EXTERNAL)/configs/aesd_qemu_defconfig

# Specify the Config.in path
BR2_EXTERNAL_CONFIG += $(BR2_EXTERNAL)/package/aesd-assignments/Config.in

