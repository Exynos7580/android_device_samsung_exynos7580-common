####################
# Graphics         #
####################

PRODUCT_PACKAGES += \
	libion \
	libfimg \
	android.hardware.graphics.allocator@2.0-impl \
	android.hardware.graphics.allocator@2.0-service \
	android.hardware.graphics.composer@2.1-impl \
	android.hardware.graphics.mapper@2.0-impl \
	libhwc2on1adapter

# RenderScript HAL
PRODUCT_PACKAGES += \
	android.hardware.renderscript@1.0-impl

# DRM
PRODUCT_PACKAGES += \
	android.hardware.drm@1.0-impl

# Not shims you are looking for
PRODUCT_PACKAGES += \
	libprocname

