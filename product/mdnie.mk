####################
# mDNIe            #
####################
ifeq ($(filter gvwifi gvlte, $(TARGET_DEVICE)),)

PRODUCT_PACKAGES += \
   AdvancedDisplay

endif
