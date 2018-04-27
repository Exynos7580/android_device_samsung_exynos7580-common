####################
# Overlays         #
####################

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay-gv

ifeq ($(filter gvwifi gvlte, $(TARGET_DEVICE)),)
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay
endif
