# NOTE: `Android.mk` is automatically generated via the
# `third_party/android/generate_android_mk.py` script. Changes should be applied
# to `third_party/android/Android.mk.template`, and the script run to regenerate
# `Android.mk`.

# Copyright (C) 2015 The Android Open Source Project
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
#  * Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
#  * Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in
#    the documentation and/or other materials provided with the
#    distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
# FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
# COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
# BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
# OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED
# AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
# OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
# SUCH DAMAGE.
#
#
# Copyright (c) 2015 ARM Ltd
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
# 1. Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in the
#    documentation and/or other materials provided with the distribution.
# 3. The name of the company may not be used to endorse or promote
#    products derived from this software without specific prior written
#    permission.
#
# THIS SOFTWARE IS PROVIDED BY ARM LTD ``AS IS'' AND ANY EXPRESS OR IMPLIED
# WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
# IN NO EVENT SHALL ARM LTD BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
# TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
# PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
# NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

LOCAL_PATH:= $(call my-dir)

# Having trouble building
# with DTC so use gcc for
# arm targets only.
ifeq ($(TARGET_ARCH),arm)
  vixl_use_clang := false
  vixl_default_clang := false
else
  vixl_use_clang := true
  vixl_default_clang :=
endif

vixl_root := $(LOCAL_PATH)/
vixl_include_files := $(vixl_root)/src/

vixl_src_files := \
  src/vixl/a64/assembler-a64.cc \
  src/vixl/a64/cpu-a64.cc \
  src/vixl/a64/debugger-a64.cc \
  src/vixl/a64/decoder-a64.cc \
  src/vixl/a64/disasm-a64.cc \
  src/vixl/a64/instructions-a64.cc \
  src/vixl/a64/instrument-a64.cc \
  src/vixl/a64/logic-a64.cc \
  src/vixl/a64/macro-assembler-a64.cc \
  src/vixl/a64/simulator-a64.cc \
  src/vixl/code-buffer.cc \
  src/vixl/compiler-intrinsics.cc \
  src/vixl/utils.cc

vixl_test_files := \
  test/test-assembler-a64.cc \
  test/test-disasm-a64.cc \
  test/test-fuzz-a64.cc \
  test/test-invalset.cc \
  test/test-runner.cc \
  test/test-simulator-a64.cc \
  test/test-utils-a64.cc

vixl_cpp_flags := \
  -DVIXL_INCLUDE_SIMULATOR \
  -DVIXL_GENERATE_SIMULATOR_INSTRUCTIONS_VALUE=0 \
  -Wall \
  -Wextra \
  -Werror \
  -fdiagnostics-show-option \
  -Wredundant-decls \
  -Wunreachable-code \
  -Wmissing-noreturn \
  -pedantic \
  -std=c++11 \

# Explicitly enable the write-strings warning. VIXL uses
# const correctly when handling string constants.
vixl_cpp_flags += \
  -Wwrite-strings \

vixl_cpp_flags_release := \
  $(vixl_cpp_flags) \
  -O3 \

vixl_cpp_flags_debug := \
  $(vixl_cpp_flags) \
  -DVIXL_DEBUG \
  -UNDEBUG \
  -O2 \
  -ggdb3 \

VIXL_COVERAGE := false

ifeq ($(ART_COVERAGE), true)
  VIXL_COVERAGE := true
endif

include $(CLEAR_VARS)
LOCAL_CLANG := $(vixl_default_clang)
LOCAL_CPP_EXTENSION := .cc
LOCAL_CPPFLAGS := $(vixl_cpp_flags_release)
LOCAL_CLANG_CFLAGS := -Wimplicit-fallthrough
LOCAL_C_INCLUDES := $(vixl_include_files)
LOCAL_SRC_FILES :=  $(vixl_src_files)
LOCAL_SHARED_LIBRARIES := liblog
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := libvixl
LOCAL_ADDITIONAL_DEPENDENCIES := $(LOCAL_PATH)/Android.mk
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_CLANG := $(vixl_default_clang)
LOCAL_CPP_EXTENSION := .cc
LOCAL_CPPFLAGS := $(vixl_cpp_flags_debug)
LOCAL_CLANG_CFLAGS := -Wimplicit-fallthrough
LOCAL_C_INCLUDES := $(vixl_include_files)
LOCAL_SRC_FILES :=  $(vixl_src_files)
LOCAL_SHARED_LIBRARIES := liblog
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := libvixld
LOCAL_ADDITIONAL_DEPENDENCIES := $(LOCAL_PATH)/Android.mk
include $(BUILD_SHARED_LIBRARY)


include $(CLEAR_VARS)
LOCAL_CLANG := $(vixl_use_clang)
LOCAL_CPP_EXTENSION := .cc
LOCAL_CPPFLAGS := $(vixl_cpp_flags_release)
LOCAL_CLANG_CFLAGS := -Wimplicit-fallthrough
LOCAL_NATIVE_COVERAGE := $(VIXL_COVERAGE)
LOCAL_C_INCLUDES := $(vixl_include_files)
LOCAL_SRC_FILES :=  $(vixl_src_files)
LOCAL_SHARED_LIBRARIES := liblog
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := libvixl
LOCAL_ADDITIONAL_DEPENDENCIES := $(LOCAL_PATH)/Android.mk
LOCAL_MULTILIB := both
include $(BUILD_HOST_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_CLANG := $(vixl_use_clang)
LOCAL_CPP_EXTENSION := .cc
LOCAL_CPPFLAGS := $(vixl_cpp_flags_debug)
LOCAL_CLANG_CFLAGS := -Wimplicit-fallthrough
LOCAL_NATIVE_COVERAGE := $(VIXL_COVERAGE)
LOCAL_C_INCLUDES := $(vixl_include_files)
LOCAL_SRC_FILES :=  $(vixl_src_files)
LOCAL_SHARED_LIBRARIES := liblog
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := libvixld
LOCAL_ADDITIONAL_DEPENDENCIES := $(LOCAL_PATH)/Android.mk
LOCAL_MULTILIB := both
include $(BUILD_HOST_SHARED_LIBRARY)

# Static libraries for host
include $(CLEAR_VARS)
LOCAL_CLANG := $(vixl_default_clang)
LOCAL_CPP_EXTENSION := .cc
LOCAL_CPPFLAGS := $(vixl_cpp_flags_release)
LOCAL_CLANG_CFLAGS := -Wimplicit-fallthrough
LOCAL_NATIVE_COVERAGE := $(VIXL_COVERAGE)
LOCAL_C_INCLUDES := $(vixl_include_files)
LOCAL_SRC_FILES :=  $(vixl_src_files)
LOCAL_STATIC_LIBRARIES := liblog
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := libvixl
LOCAL_SANITIZE_RECOVER := shift-exponent
LOCAL_ADDITIONAL_DEPENDENCIES := $(LOCAL_PATH)/Android.mk
LOCAL_MULTILIB := both
include $(BUILD_HOST_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_CLANG := $(vixl_default_clang)
LOCAL_CPP_EXTENSION := .cc
LOCAL_CPPFLAGS := $(vixl_cpp_flags_debug)
LOCAL_CLANG_CFLAGS := -Wimplicit-fallthrough
LOCAL_NATIVE_COVERAGE := $(VIXL_COVERAGE)
LOCAL_C_INCLUDES := $(vixl_include_files)
LOCAL_SRC_FILES :=  $(vixl_src_files)
LOCAL_STATIC_LIBRARIES := liblog
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := libvixld
LOCAL_SANITIZE_RECOVER := shift-exponent
LOCAL_ADDITIONAL_DEPENDENCIES := $(LOCAL_PATH)/Android.mk
LOCAL_MULTILIB := both
include $(BUILD_HOST_STATIC_LIBRARY)


######### VIXL HOST TESTS #########
#
# We only support 64bit host builds for now.
# To run all the tests: vixl-test-runner --run_all
#
include $(CLEAR_VARS)
LOCAL_CLANG := $(vixl_use_clang)
LOCAL_CPP_EXTENSION := .cc
LOCAL_CPPFLAGS := $(vixl_cpp_flags_debug)
LOCAL_CLANG_CFLAGS := -Wimplicit-fallthrough
LOCAL_NATIVE_COVERAGE := $(VIXL_COVERAGE)
LOCAL_C_INCLUDES := $(vixl_include_files)
LOCAL_SRC_FILES :=  $(vixl_test_files) $(vixl_src_files)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_HOST_ARCH := x86_64
LOCAL_FORCE_STATIC_EXECUTABLE := true
LOCAL_MODULE := vixl-test-runner
LOCAL_ADDITIONAL_DEPENDENCIES := $(LOCAL_PATH)/Android.mk
include $(BUILD_HOST_EXECUTABLE)

.PHONY: run-vixl-tests
run-vixl-tests: vixl-test-runner
	$(vixl_root)/third_party/android/check_top_level_android_mk.sh
	$(HOST_OUT)/bin/vixl-test-runner --run_all
	$(HOST_OUT)/bin/vixl-test-runner --run_all --debugger
	@echo vixl tests PASSED
