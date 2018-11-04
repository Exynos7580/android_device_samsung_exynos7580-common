#
# Copyright (C) 2018 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH := device/samsung/exynos7580-common

# Include headers
TARGET_SPECIFIC_HEADER_PATH := device/samsung/exynos7580-common/include

TARGET_PROCESS_SDK_VERSION_OVERRIDE += \
    /system/bin/mediaserver=24 \
    /system/vendor/bin/hw/rild=24

ifeq ($(WITH_TWRP),true)
include $(LOCAL_PATH)/twrp.mk
endif

# SELinux
BOARD_SEPOLICY_DIRS += device/samsung/exynos7580-common/sepolicy

# Properties
TARGET_SYSTEM_PROP := $(LOCAL_PATH)/system.prop

# HWComposer
TARGET_HWC2_NO_SKIPVALIDATE := true

# Inherit splitted common board configs
-include $(LOCAL_PATH)/board/*.mk
