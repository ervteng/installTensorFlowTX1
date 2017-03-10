#!/bin/bash
# NVIDIA Jetson TX1
# TensorFlow Installation
# Build Bazel
INSTALL_DIR=$PWD
cd $HOME
# zip in release 0.4.3 includes working arm32 binaries for bootstrapping
wget https://github.com/bazelbuild/bazel/releases/download/0.4.3/bazel-0.4.3-dist.zip --no-check-certificate
mkdir bazel-0.4.3
cd bazel-0.4.3/
unzip ../bazel-0.4.3-dist.zip
# yet bazel needs to be patched to compile (and run correctly) on aarch64
patch -p1 <$INSTALL_DIR/patches/bazel-0.4.3-arm64.patch
./compile.sh
sudo cp output/bazel /usr/local/bin
