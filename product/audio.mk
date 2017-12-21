####################
# Audio		       #
####################

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/audio_effects.conf:system/vendor/etc/audio_effects.conf

PRODUCT_PACKAGES += \
    audio.primary.universal7580 \
    audio.a2dp.default \
    audio.r_submix.default \
    audio.usb.default \
    tinymix \
   android.hardware.audio@2.0-impl \
   android.hardware.audio@2.0-service \
   android.hardware.audio.effect@2.0-impl
