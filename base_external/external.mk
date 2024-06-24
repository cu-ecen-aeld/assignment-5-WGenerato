# base_external/external.mk
include $(sort $(wildcard $(BR2_EXTERNAL_project_base_PATH)/package/*/*.mk))

