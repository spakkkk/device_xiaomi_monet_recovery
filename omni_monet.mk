#
# Copyright (C) 2020 The Android Open Source Project
# Copyright (C) 2020 The PBRP Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

PRODUCT_RELEASE_NAME := monet
PRODUCT_USE_DYNAMIC_PARTITIONS := true
DEVICE_PATH := device/xiaomi/monet

$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)

# Inherit some common PitchBlack stuff.
$(call inherit-product, vendor/pb/config/common.mk)

PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,$(LOCAL_PATH)/recovery/root,recovery/root)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := monet
PRODUCT_NAME := omni_monet
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Xiaomi Mi 10 Lite 5G
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_RELEASE_NAME := Xiaomi Mi 10 Lite 5G

# enable stock zip packages flash
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.allow.mock.location=1

# Build info
PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT="Xiaomi/monet_eea/monet:10/QKQ1.191222.002/12.0.2:user/release-keys"

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=monet \
    PRODUCT_NAME=monet \
    PRIVATE_BUILD_DESC="monet-user 10 QKQ1.191222.002 12.0.2 release-keys"

# HACK: Set vendor patch level
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.build.security_patch=2099-12-31

PRODUCT_SYSTEM_PROPERTY_BLACKLIST += \
    ro.product.device \
    ro.product.name \
    ro.build.product \
    ro.bootimage.build.date.utc \
    ro.build.date.utc \
    ro.build.date
