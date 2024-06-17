# base_external/external.mk
BR2_EXTERNAL_PACKAGES += aesd-assignments

# Include the package makefile with a relative path
include $(BR2_EXTERNAL)/package/aesd-assignments/aesd-assignments.mk

# Specify the Config.in path
BR2_EXTERNAL_CONFIG += $(BR2_EXTERNAL)/package/aesd-assignments/Config.in

