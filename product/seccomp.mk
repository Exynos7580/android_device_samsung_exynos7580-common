#
# Seccomp
#

PRODUCT_COPY_FILES += \
    $(VENDOR_PATH)/configs/seccomp/mediaextractor-seccomp.policy:system/vendor/etc/seccomp_policy/mediaextractor.policy \
    $(VENDOR_PATH)/configs/seccomp/mediacodec-seccomp.policy:system/vendor/etc/seccomp_policy/mediacodec.policy

