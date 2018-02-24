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
LOCAL_SRC_FILES := CameraSource.cpp

LOCAL_C_INCLUDES := \
    $(TOP)/frameworks/av/include \
    $(TOP)/frameworks/native/include/media/hardware \
    $(TOP)/frameworks/native/include/media/openmax \
    $(TOP)/frameworks/native/libs/arect/include \
    $(TOP)/frameworks/native/libs/nativebase/include

LOCAL_SHARED_LIBRARIES := \
    android.hardware.graphics.bufferqueue@1.0 \
    android.hidl.token@1.0-utils \
    libbase \
    libcamera_client \
    liblog

LOCAL_MODULE := libstagefright_shim
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_VENDOR_MODULE := true

include $(BUILD_SHARED_LIBRARY)
