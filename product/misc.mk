###############
# Misc        #
###############

ifeq ($(filter gvwifi gvlte, $(TARGET_DEVICE)),)

PRODUCT_PACKAGES += \
	FlipFlap

endif

# TextClassifier smart selection model files
PRODUCT_PACKAGES += \
    textclassifier.smartselection.bundle1