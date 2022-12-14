
ifneq ($(filter rk%, $(TARGET_BOARD_PLATFORM)),)

LOCAL_PATH := $(call my-dir)

ifneq ($(strip $(TARGET_BOARD_PLATFORM_GPU)), mali-t860)
ifneq ($(strip $(TARGET_BOARD_PLATFORM_GPU)), mali-450)
endif
$(error No libGLES_mali prebuilts for '$(TARGET_BOARD_PLATFORM_GPU)')
endif

include $(CLEAR_VARS)
LOCAL_MODULE_SUFFIX     := .so
LOCAL_MODULE            := libGLES_mali
LOCAL_MODULE_CLASS      := SHARED_LIBRARIES
LOCAL_MULTILIB          := both
LOCAL_SRC_FILES_arm64   := $(TARGET_BOARD_PLATFORM_GPU)/lib64/libGLES_mali.so
LOCAL_SRC_FILES_arm     := $(TARGET_BOARD_PLATFORM_GPU)/lib/libGLES_mali.so
LOCAL_MODULE_PATH_32    := $(TARGET_OUT_VENDOR)/lib/egl
LOCAL_MODULE_PATH_64    := $(TARGET_OUT_VENDOR)/lib64/egl
LOCAL_SHARED_LIBRARIES  := libc++ libc libcutils libdl libhardware liblog libm libutils libz libutilscallstack
include $(BUILD_PREBUILT)

endif # $(TARGET_BOARD_PLATFORM)
