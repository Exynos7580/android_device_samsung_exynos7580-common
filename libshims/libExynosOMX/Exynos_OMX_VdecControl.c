/*
 * Copyright (C) 2012 Samsung Electronics S.LSI Co. LTD
 * Copyright (C) 2017 TeamNexus
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

#define LOG_TAG "libExynosOMX_shim"

#include <dlfcn.h>
#include <utils/Log.h>

int Exynos_OSAL_Strcmp(const char *s1, const char *s2)
{
	void *ptr;
	int ret;
	Dl_info info;

	/* get address of parent function */
	ptr = __builtin_return_address(0);

	/* skip index-check if we couldn't get return-address */
	if (!ptr) {
		ALOGE("%s: failed to retrieve return address", __func__);
		goto exit;
	}

	/* get infos about parent function */
	ret = dladdr(ptr, &info);

	/* skip index-check if we couldn't get infos about parent function */
	if (!ret) {
		ALOGE("%s: failed to retrieve informations about parent function", __func__);
		goto exit;
	}
	
	/* check if the parent function is Exynos_OMX_VideoDecodeGetExtensionIndex() */
	if (strcmp(info.dli_sname, "Exynos_OMX_VideoDecodeGetExtensionIndex")) {
		/* no log here... */
		goto exit;
	}

	/* prevent check for storeMetaDataInBuffers-support to succeed */
	if (!strcmp(s1, "OMX.google.android.index.storeMetaDataInBuffers")) {
		ALOGI("%s: failing check for storeMetaDataInBuffers-support", __func__);
		return -1;
	}

exit:
	return strcmp(s1, s2);
}
