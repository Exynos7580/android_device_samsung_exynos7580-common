####################
# Graphics  	   #
####################

# OpenGL
USE_OPENGL_RENDERER := true

# Maximum size of the  GLES Shaders that can be cached for reuse.
MAX_EGL_CACHE_KEY_SIZE := 12*1024

# Maximum GLES shader cache size
MAX_EGL_CACHE_SIZE := 2048*1024

# Screen casting
BOARD_USES_WFD := true

# BGRA mixing
BOARD_USE_BGRA_8888_FB := true

# Virtual display
BOARD_USES_VIRTUAL_DISPLAY := true

# HWC
BOARD_USES_HWC_SERVICES := true

# FIMG2API
BOARD_USES_SKIA_FIMGAPI := true

# HDMI
BOARD_HDMI_INCAPABLE := true
BOARD_USES_GSC_VIDEO := true

EXYNOS5_ENHANCEMENTS := true

ifdef EXYNOS5_ENHANCEMENTS
TARGET_GLOBAL_CFLAGS += -DEXYNOS5_ENHANCEMENTS
endif
