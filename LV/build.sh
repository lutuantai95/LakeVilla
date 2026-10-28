#!/bin/sh
# Compile LakeVilla from the mounted /LakeVilla/src and link the binaries into
# /LakeVilla, where the README's commands expect them.
set -e

cmake -S /LakeVilla/src -B /LakeVilla/build -G Ninja \
  -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=/LakeVilla/aws
cmake --build /LakeVilla/build

for bin in ui-lv ycsbc-lv tpcc-lv cab-lv hermitage-lv tpcds-lv lstbench-lv; do
  ln -sf /LakeVilla/build/$bin /LakeVilla/$bin
done
ln -sfn /LakeVilla/src/YCSB-C /LakeVilla/YCSB-C
