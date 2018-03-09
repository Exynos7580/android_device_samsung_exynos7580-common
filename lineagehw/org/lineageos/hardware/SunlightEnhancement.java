/*
 * Copyright (C) 2014 The CyanogenMod Project
 * Copyright (C) 2018 The LineageOS Project
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

package org.lineageos.hardware;

import org.lineageos.internal.util.FileUtils;

/**
 * Sunlight Readability Enhancement support, aka Facemelt Mode.
 *
 * Brightens up the screen via image processing or other tricks when
 * under aggressive lighting conditions. Usually depends on CABC
 * support.
 */
public class SunlightEnhancement {

    private static final String HBM_PATH = "/sys/class/mdnie/mdnie/lux";
    /* see drivers/video/exynos/decon_7580/panels/mdnie_lite_table*, get_hbm_index */
    private static final String HBM_MIN_VALUE = "40000";

    /**
     * Whether device supports SRE
     *
     * @return boolean Supported devices must return always true
     */
    public static boolean isSupported() {
        return FileUtils.isFileWritable(HBM_PATH) &&
                FileUtils.isFileReadable(HBM_PATH);
    }

    /**
     * This method return the current activation status of SRE
     *
     * @return boolean Must be false when SRE is not supported or not activated, or
     * the operation failed while reading the status; true in any other case.
     */
    public static boolean isEnabled() {
        return Integer.parseInt(FileUtils.readOneLine(HBM_PATH)) > 0;
    }

    /**
     * This method allows to setup SRE.
     *
     * @param status The new SRE status
     * @return boolean Must be false if SRE is not supported or the operation
     * failed; true in any other case.
     */
    public static boolean setEnabled(boolean status) {
        String value = status ? HBM_MIN_VALUE : "0";
        return FileUtils.writeLine(HBM_PATH, value);
    }

    /**
     * Whether adaptive backlight (CABL / CABC) is required to be enabled
     *
     * @return boolean False if adaptive backlight is not a dependency
     */
    public static boolean isAdaptiveBacklightRequired() {
        return false;
    }

    /**
     * Set this to true if the implementation is self-managed and does
     * it's own ambient sensing. In this case, setEnabled is assumed
     * to toggle the feature on or off, but not activate it. If set
     * to false, LiveDisplay will call setEnabled when the ambient lux
     * threshold is crossed.
     *
     * @return true if this enhancement is self-managed
     */
    public static boolean isSelfManaged() {
        return false;
    }
}
