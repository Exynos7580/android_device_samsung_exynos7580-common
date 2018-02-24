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

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    Exynos_OMX_VdecControl.c

LOCAL_SHARED_LIBRARIES := \
    libbase \
    libcutils \
    libhardware \
    liblog \
    libnativewindow \
    libsync \
    libui

LOCAL_STATIC_LIBRARIES := \
    libarect

LOCAL_C_INCLUDES := \
    frameworks/native/include/media/openmax/ \
    hardware/samsung_slsi-cm/exynos/include \
    hardware/samsung_slsi-cm/exynos/libvideocodec/include \
    hardware/samsung_slsi-cm/$(TARGET_BOARD_PLATFORM)/include \
    hardware/samsung_slsi-cm/$(TARGET_SOC)/include \
    hardware/samsung_slsi-cm/openmax/component/common/ \
    hardware/samsung_slsi-cm/openmax/include/ \
    hardware/samsung_slsi-cm/openmax/include/exynos/ \
    hardware/samsung_slsi-cm/openmax/osal/ \
    $(TOP)/frameworks/native/libs/nativewindow/include

LOCAL_MODULE := libExynosOMX_shim
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_VENDOR_MODULE := true

include $(BUILD_SHARED_LIBRARY)
