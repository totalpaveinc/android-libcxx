
# libcxx

This repository contains build scripts to package android's libc++_shared.so files into an AAR, which applications can then import to provide the same shared library for native libraries.

This library does not contain the original shared files. Installing NDK is required for building the AAR and receiving the shared libraries.

# License

See [LICENSE](./LICENSE)

# TotalPave Committers

This repository contains submodules. Clone this repo with the `--recurse-submodules` flag.

e.g: `git clone --recurse-submodules git@github.com:totalpaveinc/android-libcxx.git`

If you have already cloned without submodules, you can correct the repo by running `git submodule update --init`

Without the `bin/` (`android-libcxx-bin`) submodule, the `install.sh` script will not work properly.
