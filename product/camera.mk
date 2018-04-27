####################
# Camera
####################

ifeq ($(filter gvwifi gvlte, $(TARGET_DEVICE)),)

PRODUCT_PACKAGES += \
	Snap

endif

PRODUCT_PACKAGES += \
	camera.device@3.2-impl \
	camera.device@1.0-impl-legacy \
	android.hardware.camera.provider@2.4-impl-legacy
