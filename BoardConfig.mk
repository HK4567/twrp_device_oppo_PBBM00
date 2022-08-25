#
# Copyright (C) 2022 The TWRP Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#


DEVICE_PATH := device/oppo/PBBM00

# Architecture
TARGET_ARCH         := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI 		:= arm64-v8a
TARGET_CPU_ABI2 	:=
TARGET_CPU_VARIANT 	:= cortex-a73
 
TARGET_2ND_ARCH 		:= arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI 		:= armeabi-v7a
TARGET_2ND_CPU_ABI2 	:= armeabi
TARGET_2ND_CPU_VARIANT  := cortex-a53

TARGET_BOARD_SUFFIX 	  := _64
TARGET_USES_64_BIT_BINDER := true

# Assert
TARGET_OTA_ASSERT_DEVICE := PBBM00,PBBT00,PBCM00,PBCT00

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := mt6771
TARGET_NO_BOOTLOADER 		 := true

# Platform
TARGET_BOARD_PLATFORM 	  := mt6771
TARGET_BOARD_PLATFORM_GPU := Mali-G72

# MTK Hardware
#BOARD_HAS_MTK_HARDWARE  := true
#BOARD_USES_MTK_HARDWARE := true
#MTK_HARDWARE 			 := true

# Kernel
BOARD_KERNEL_CMDLINE 		 := bootopt=64S3,32N2,64N2 androidboot.configfs=true androidboot.selinux=permissive buildvariant=eng
BOARD_KERNEL_CMDLINE 		 += veritykeyid=id:cb9c6e56bc64e2771189107e8da547e51cc7e2f8
TARGET_KERNEL_ARCH 		     := arm64
TARGET_KERNEL_HEADER_ARCH  	 := arm64
TARGET_PREBUILT_KERNEL		 := $(DEVICE_PATH)/prebuilt/kernel
BOARD_HASH_TYPE      	     := sha1
BOARD_KERNEL_PAGESIZE 		 := 2048
BOARD_KERNEL_BASE      		 := 0x40078000
BOARD_KERNEL_OFFSET    		 := 0x00008000
BOARD_KERNEL_TAGS_OFFSET 	 := 0x13f88000
BOARD_RAMDISK_OFFSET   		 := 0x14f88000
BOARD_BOOTIMG_HEADER_VERSION := 1
BOARD_MKBOOTIMG_ARGS 		 := --ramdisk_offset $(BOARD_RAMDISK_OFFSET) --tags_offset $(BOARD_KERNEL_TAGS_OFFSET) --header_version $(BOARD_BOOTIMG_HEADER_VERSION)

# Partitions
BOARD_FLASH_BLOCK_SIZE               := 131072		# (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE       := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE   := 67108864
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_PARTITION_TYPE     := ext4
BOARD_CACHEMIMAGE_PARTITION_TYPE     := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE   := ext4

# Workaround for error copying vendor files to recovery ramdisk
TARGET_COPY_OUT_VENDOR := vendor

# File systems
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# System as root
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
BOARD_SUPPRESS_SECURE_ERASE   := true

# Fstab
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
RECOVERY_SDCARD_ON_DATA      := true
BOARD_HAS_NO_SELECT_BUTTON   := true
BOARD_HAS_LARGE_FILESYSTEM   := true

# TWRP Configuration
TW_THEME           		:= portrait_hdpi
TW_INPUT_BLACKLIST 		:= "hbtp_vm"
TW_BRIGHTNESS_PATH 		:= /sys/class/leds/lcd-backlight/brightness
TW_MAX_BRIGHTNESS 		:= 2047
TW_DEFAULT_BRIGHTNESS 	:= 1200
TW_Y_OFFSET 			:= 100
TW_H_OFFSET 			:= -100

TW_INCLUDE_REPACKTOOLS 		:= true
TW_INCLUDE_NTFS_3G     		:= true
TW_INCLUDE_FB2PNG 			:= true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TARGET_RECOVERY_INITRC 		:= $(DEVICE_PATH)/recovery/root/init.recovery.mt6771.rc
TARGET_USES_MKE2FS		    := true
TW_EXCLUDE_TWRPAPP 			:= true
TW_EXCLUDE_SUPERSU		    := true
TW_USE_TOOLBOX     			:= true
TW_NO_SCREEN_BLANK		    := true
TW_SCREEN_BLANK_ON_BOOT 	:= true

# zh_CN
TW_EXTRA_LANGUAGES  := true
TW_DEFAULT_LANGUAGE := zh_CN
 
# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION 		:= 9.0
TW_DEVICE_VERSION 		:= OPPO A7x by HK4567_8.24

# Ozip
TW_OZIP_DECRYPT_KEY := "172B3E14E46F3CE13E2B5121CBDC4321"

# Debugging
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD    := true
