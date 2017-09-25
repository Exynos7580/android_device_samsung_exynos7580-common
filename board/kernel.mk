####################
# Kernel		   #
####################

# Kernel configuration
TARGET_LINUX_KERNEL_VERSION := 3.10
TARGET_KERNEL_ARCH := arm64
ifeq ($(FORCE_32_BIT),true)
TARGET_KERNEL_HEADER_ARCH := arm
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-
KERNEL_TOOLCHAIN := $(ANDROID_BUILD_TOP)/prebuilts/gcc/$(HOST_OS)-x86/aarch64/aarch64-linux-android-4.9/bin
endif
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_KERNEL_PAGESIZE := 2048
ifneq ($(FORCE_32_BIT),true)
TARGET_USES_UNCOMPRESSED_KERNEL := true
endif

# CPUSETS
ENABLE_CPUSETS := true
