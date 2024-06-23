# base_external/external.mk

BR2_EXTERNAL_PACKAGES += aesd-assignments

# Include the package makefile with relative path
include /home/tt20/aesd-assignment-4/base_external/package/aesd-assignments/aesd-assignments.mk

# Add the defconfig file to the configuration path
BR2_DEFCONFIG = /home/tt20/aesd-assignment-4/base_external/configs/aesd_qemu_defconfig

