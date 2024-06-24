##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

# Fill up the contents below in order to reference your assignment 3 git contents
AESD_ASSIGNMENTS_VERSION = fd6091dcb241c240a34442b69d6c649e9e71f8bd   
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESD_ASSIGNMENTS_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-WGenerato.git
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

define AESD_ASSIGNMENTS_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D)
endef

define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	$(INSTALL) -d 0755 $(TARGET_DIR)/etc/finder-app/conf/
	$(INSTALL) -m 0755 $(@D)/conf/* $(TARGET_DIR)/etc/finder-app/conf/
	$(INSTALL) -m 0755 $(@D)/assignment-autotest/test/assignment4/* $(TARGET_DIR)/bin
	$(INSTALL) -D -m 0755 $(@D)/aesdsocket $(TARGET_DIR)/usr/bin/aesdsocket
	$(INSTALL) -d $(TARGET_DIR)/etc/init.d/
	$(INSTALL) -m 0755 $(@D)/server/aesdsocket-start-stop.sh $(TARGET_DIR)/etc/init.d/S99aesdsocket
endef

define AESD_ASSIGNMENTS_PREPARE_SOURCE
    git clone $(AESD_ASSIGNMENTS_SITE) $(@D)
    cd $(@D) && git checkout $(AESD_ASSIGNMENTS_VERSION)
endef

$(eval $(generic-package))

