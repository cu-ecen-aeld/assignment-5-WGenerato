AESD_ASSIGNMENTS_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-WGenerato.git
AESD_ASSIGNMENTS_SITE_METHOD = git

define AESD_ASSIGNMENTS_BUILD_CMDS
    $(TARGET_MAKE_ENV) $(MAKE1) -C $(@D)
endef

define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
    $(INSTALL) -m 0755 $(@D)/tester.sh $(TARGET_DIR)/usr/bin/
    $(INSTALL) -m 0755 $(@D)/writer $(TARGET_DIR)/usr/bin/
    $(INSTALL) -m 0755 $(@D)/finder.sh $(TARGET_DIR)/usr/bin/
    $(INSTALL) -m 0755 $(@D)/finder-test.sh $(TARGET_DIR)/usr/bin/
    $(INSTALL) -d $(TARGET_DIR)/etc/finder-app/conf
    $(INSTALL) -m 0644 $(@D)/conf/* $(TARGET_DIR)/etc/finder-app/conf/
endef

$(eval $(generic-package))
