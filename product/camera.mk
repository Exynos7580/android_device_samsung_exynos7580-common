####################
# Camera
####################

ifeq ($(filter gvwifi gvlte, $(TARGET_DEVICE)),)

PRODUCT_PACKAGES += \
	Camera2

endif

PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-impl-legacy \
    android.hardware.camera.provider@2.4-service
