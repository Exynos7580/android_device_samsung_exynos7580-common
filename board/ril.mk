ifeq ($(TARGET_RIL_VARIANT),exynos7580-common)
# Do not set vendor to not automatically include hardware/samsung
BOARD_VENDOR :=
endif
