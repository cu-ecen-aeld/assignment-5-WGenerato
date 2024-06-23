# base_external/external.mk

BR2_EXTERNAL_PACKAGES += aesd-assignments

# Include the package makefile with relative path
include $(GITHUB_WORKSPACE)/base_external/package/aesd-assignments/aesd-assignments.mk

# Add the defconfig file to the configuration path
BR2_DEFCONFIG = $(GITHUB_WORKSPACE)/base_external/configs/aesd_qemu_defconfig

