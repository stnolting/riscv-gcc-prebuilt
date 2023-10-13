#!/bin/bash

set -e

echo ""

PREFIX=riscv32-unknown-elf
RELEASE=rv32i-4.0.0
ARCHIVE=riscv32-unknown-elf.gcc-12.1.0
echo "Checking $RELEASE : $ARCHIVE/$PREFIX..."
wget https://github.com/stnolting/riscv-gcc-prebuilt/releases/download/$RELEASE/$ARCHIVE.tar.gz
ls -al
mkdir $GITHUB_WORKSPACE/$ARCHIVE.tmp
tar -xzf $ARCHIVE.tar.gz -C $GITHUB_WORKSPACE/$ARCHIVE.tmp/
$GITHUB_WORKSPACE/$ARCHIVE.tmp/bin/$PREFIX-gcc -v

echo ""

PREFIX=riscv32-unknown-elf
RELEASE=rv32i-131023
ARCHIVE=riscv32-unknown-elf.gcc-13.2.0
echo "Checking $RELEASE : $ARCHIVE/$PREFIX..."
wget https://github.com/stnolting/riscv-gcc-prebuilt/releases/download/$RELEASE/$ARCHIVE.tar.gz
ls -al
mkdir $GITHUB_WORKSPACE/$ARCHIVE.tmp
tar -xzf $ARCHIVE.tar.gz -C $GITHUB_WORKSPACE/$ARCHIVE.tmp/
$GITHUB_WORKSPACE/$ARCHIVE.tmp/bin/$PREFIX-gcc -v
