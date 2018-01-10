####################
# Platform         #
####################

ifeq ($(TARGET_RIL_VARIANT),exynos7580-common)
# Do not set vendor to not automatically include hardware/samsung
BOARD_VENDOR :=
else
BOARD_VENDOR := samsung
endif

TARGET_BOARD_PLATFORM := exynos5
TARGET_SOC := exynos7580
TARGET_SLSI_VARIANT := cm

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

TARGET_BOOTLOADER_BOARD_NAME := universal7580