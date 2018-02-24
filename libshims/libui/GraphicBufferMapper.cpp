/*
 * Copyright (C) 2007 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#define LOG_TAG "GraphicBufferMapper_shim"
#define LOG_NDEBUG 0

#include <stdint.h>
#include <errno.h>

#include <sync/sync.h>

#include <utils/Errors.h>
#include <utils/Log.h>
#include <utils/Trace.h>

#include <ui/Rect.h>

#include <hardware/gralloc.h>

#include "GraphicBufferMapper.h"

namespace android {

ANDROID_SINGLETON_STATIC_INSTANCE( GraphicBufferMapper )

GraphicBufferMapper::GraphicBufferMapper()
	: mModule(nullptr)
{
	const hw_module_t* module;
	int err = hw_get_module(GRALLOC_HARDWARE_MODULE_ID, &module);

	ALOGE_IF(err, "cannot find gralloc-module %s", GRALLOC_HARDWARE_MODULE_ID);
	if (err == 0) {
		mModule = reinterpret_cast<gralloc_module_t const *>(module);
	}
}

status_t GraphicBufferMapper::importBuffer(buffer_handle_t handle, buffer_handle_t* outHandle)
{
	ATRACE_CALL();
	status_t err;

	if (mModule->registerBuffer == NULL) {
		ALOGW("registerBuffer(%p) not found", handle);
		return -EINVAL;
	}

	err = mModule->registerBuffer(mModule, handle);
	*outHandle = handle;

	ALOGW_IF(err, "registerBuffer(%p) failed: %d (%s)", handle, -err, strerror(-err));
	return err;
}

status_t GraphicBufferMapper::freeBuffer(buffer_handle_t handle)
{
	ATRACE_CALL();
	status_t err;

	if (mModule->unregisterBuffer == NULL) {
		ALOGW("unregisterBuffer(%p) not found", handle);
		return -EINVAL;
	}

	err = mModule->unregisterBuffer(mModule, handle);

	ALOGW_IF(err, "unregisterBuffer(%p) failed: %d (%s)", handle, -err, strerror(-err));
	return err;
}

status_t GraphicBufferMapper::lock(buffer_handle_t handle,
		uint32_t usage, const Rect& bounds, void** vaddr)
{
	ATRACE_CALL();
	status_t err;

	if (mModule->lock == NULL) {
		ALOGW("lock(%p) not found", handle);
		return -EINVAL;
	}

	err = mModule->lock(mModule, handle, static_cast<int>(usage),
			bounds.left, bounds.top, bounds.width(), bounds.height(),
			vaddr);

	ALOGW_IF(err, "lock(%p) failed: %d (%s)", handle, -err, strerror(-err));
	return err;
}

status_t GraphicBufferMapper::lockYCbCr(buffer_handle_t handle,
		uint32_t usage, const Rect& bounds, android_ycbcr *ycbcr)
{
	ATRACE_CALL();
	status_t err;

	if (mModule->lock_ycbcr == NULL) {
		ALOGW("lock_ycbcr(%p) not found", handle);
		return -EINVAL;
	}

	err = mModule->lock_ycbcr(mModule, handle, static_cast<int>(usage),
			bounds.left, bounds.top, bounds.width(), bounds.height(),
			ycbcr);

	ALOGW_IF(err, "lock_ycbcr(%p) failed: %d (%s)", handle, -err, strerror(-err));
	return err;
}

status_t GraphicBufferMapper::unlock(buffer_handle_t handle)
{
	ATRACE_CALL();
	status_t err;

	if (mModule->unlock == NULL) {
		ALOGW("unlock(%p) not found", handle);
		return -EINVAL;
	}

	err = mModule->unlock(mModule, handle);

	ALOGW_IF(err, "unlock(%p) failed: %d (%s)", handle, -err, strerror(-err));
	return err;
}

}; // namespace android
