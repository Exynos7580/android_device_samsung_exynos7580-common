####################
# Samsung Doze     #
####################

ifeq ($(filter gvwifi gvlte, $(TARGET_DEVICE)),)

PRODUCT_PACKAGES += \
    SamsungDoze

endif
