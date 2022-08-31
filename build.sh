#!/bin/bash

# Copyright 2022 Total Pave Inc.

# Permission is hereby granted, free of charge, to any person obtaining a copy of this
# software and associated documentation files (the "Software"), to deal in the Software
# without restriction, including without limitation the rights to use, copy, modify,
# merge, publish, distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to the following
# conditions:

# The above copyright notice and this permission notice shall be included in all copies
# or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
# INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
# PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
# HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
# CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
# OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

NDK_VERSION="`cat VERSION`"

BUILD_HOST="`uname | sed 's/./\L&/g'`-`uname -p`"

ANDROID_TOOLCHAIN_ROOT=${ANDROID_HOME}/ndk/${NDK_VERSION}/toolchains/llvm/prebuilt/${BUILD_HOST}
ANDROID_SYSROOT=${ANDROID_TOOLCHAIN_ROOT}/sysroot

ANDROID_LIB=$ANDROID_SYSROOT/usr/lib/

echo $ANDROID_LIB

AAR_LIB=`pwd`/libcxx/src/main/jniLibs/

mkdir -p $AAR_LIB/arm64-v8a
mkdir -p $AAR_LIB/armeabi-v7a
mkdir -p $AAR_LIB/x86
mkdir -p $AAR_LIB/x86_64

cp $ANDROID_LIB/aarch64-linux-android/libc++_shared.so $AAR_LIB/arm64-v8a/libc++_shared.so
cp $ANDROID_LIB/arm-linux-androideabi/libc++_shared.so $AAR_LIB/armeabi-v7a/libc++_shared.so
cp $ANDROID_LIB/i686-linux-android/libc++_shared.so $AAR_LIB/x86/libc++_shared.so
cp $ANDROID_LIB/x86_64-linux-android/libc++_shared.so $AAR_LIB/x86_64/libc++_shared.so

gradle wrapper
./gradlew build

mkdir -p bin

cp libcxx/build/outputs/aar/libcxx-release.aar bin/libcxx-${NDK_VERSION}.aar
