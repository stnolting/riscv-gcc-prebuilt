#!/bin/bash

# Abort if any command returns != 0
set -e

# Decompress and test
echo ""

TOOLCHAIN=riscv32-unknown-elf
RELEASE=rv32e-1.0.0
TEST=riscv32-unknown-elf.gcc-10.1.0.rv32e.ilp32e.newlib
echo "Testing $RELEASE : $TEST/$TOOLCHAIN..."
wget https://github.com/stnolting/riscv-gcc-prebuilt/releases/download/$RELEASE/$TEST.tar.gz
ls -al
mkdir $GITHUB_WORKSPACE/$TEST.tmp
tar -xzf $TEST.tar.gz -C $GITHUB_WORKSPACE/$TEST.tmp/
$GITHUB_WORKSPACE/$TEST.tmp/bin/$TOOLCHAIN-gcc -v

echo ""

TOOLCHAIN=riscv32-unknown-elf
RELEASE=rv32i-2.0.0
TEST=riscv32-unknown-elf.gcc-10.2.0.rv32i.ilp32.newlib
echo "Testing $RELEASE : $TEST/$TOOLCHAIN..."
wget https://github.com/stnolting/riscv-gcc-prebuilt/releases/download/$RELEASE/$TEST.tar.gz
ls -al
mkdir $GITHUB_WORKSPACE/$TEST.tmp
tar -xzf $TEST.tar.gz -C $GITHUB_WORKSPACE/$TEST.tmp/
$GITHUB_WORKSPACE/$TEST.tmp/bin/$TOOLCHAIN-gcc -v

echo ""

TOOLCHAIN=riscv64-unknown-elf
RELEASE=rv64imc-3.0.0
TEST=riscv64-unknown-elf.gcc-12.1.0
echo "Testing $RELEASE : $TEST/$TOOLCHAIN..."
wget https://github.com/stnolting/riscv-gcc-prebuilt/releases/download/$RELEASE/$TEST.tar.gz
ls -al
mkdir $GITHUB_WORKSPACE/$TEST.tmp
tar -xzf $TEST.tar.gz -C $GITHUB_WORKSPACE/$TEST.tmp/
$GITHUB_WORKSPACE/$TEST.tmp/bin/$TOOLCHAIN-gcc -v
