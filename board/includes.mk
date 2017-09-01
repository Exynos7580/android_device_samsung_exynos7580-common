####################
# Includes		   #
####################


# Hardware config include
TARGET_SPECIFIC_HEADER_PATH := $(VENDOR_PATH)/include

# CM Hardware
BOARD_HARDWARE_CLASS += hardware/samsung/cmhw

# Properties
TARGET_SYSTEM_PROP := $(VENDOR_PATH)/system.prop

# LED path
BACKLIGHT_PATH := "/sys/class/backlight/panel/brightness"

# SELinux
BOARD_SEPOLICY_DIRS := $(VENDOR_PATH)/sepolicy

# Seccomp filters
BOARD_SECCOMP_POLICY += $(VENDOR_PATH)/seccomp