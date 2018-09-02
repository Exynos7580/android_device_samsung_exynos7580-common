####################
# Includes		   #
####################


# Hardware config include
TARGET_SPECIFIC_HEADER_PATH := $(VENDOR_PATH)/include

# Lineage Hardware
JAVA_SOURCE_OVERLAYS := \
    org.lineageos.hardware|hardware/samsung/lineagehw|**/*.java \
    org.lineageos.hardware|$(VENDOR_PATH)/lineagehw|**/*.java

# Properties
TARGET_SYSTEM_PROP := $(VENDOR_PATH)/system.prop

ifeq ($(filter gvwifi gvlte, $(TARGET_DEVICE)),)
TARGET_SYSTEM_PROP += $(VENDOR_PATH)/nfc.prop
TARGET_SYSTEM_PROP += $(VENDOR_PATH)/ril.prop
TARGET_SPECIFIC_HEADER_PATH += $(VENDOR_PATH)/ril/include
endif

# LED path
BACKLIGHT_PATH := "/sys/class/backlight/panel/brightness"
