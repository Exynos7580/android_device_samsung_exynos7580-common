####################
# NFC			   #
####################

ifeq ($(filter gvwifi gvlte, $(TARGET_DEVICE)),)

BOARD_NFC_HAL_SUFFIX := universal7580
BOARD_HAVE_NFC := true

endif
