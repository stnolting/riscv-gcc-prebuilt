#!/bin/bash

set -e

echo ""

PREFIX=riscv32-unknown-elf
RELEASE=rv32e-1.0.0
ARCHIVE=riscv32-unknown-elf.gcc-10.1.0.rv32e.ilp32e.newlib
echo "Checking $RELEASE : $ARCHIVE/$PREFIX..."
wget https://github.com/stnolting/riscv-gcc-prebuilt/releases/download/$RELEASE/$ARCHIVE.tar.gz
ls -al
mkdir $GITHUB_WORKSPACE/$ARCHIVE.tmp
tar -xzf $ARCHIVE.tar.gz -C $GITHUB_WORKSPACE/$ARCHIVE.tmp/
$GITHUB_WORKSPACE/$ARCHIVE.tmp/bin/$PREFIX-gcc -v

echo ""

PREFIX=riscv32-unknown-elf
RELEASE=rv32i-2.0.0
ARCHIVE=riscv32-unknown-elf.gcc-10.2.0.rv32i.ilp32.newlib
echo "Checking $RELEASE : $ARCHIVE/$PREFIX..."
wget https://github.com/stnolting/riscv-gcc-prebuilt/releases/download/$RELEASE/$ARCHIVE.tar.gz
ls -al
mkdir $GITHUB_WORKSPACE/$ARCHIVE.tmp
tar -xzf $ARCHIVE.tar.gz -C $GITHUB_WORKSPACE/$ARCHIVE.tmp/
$GITHUB_WORKSPACE/$ARCHIVE.tmp/bin/$PREFIX-gcc -v

echo ""

PREFIX=riscv64-unknown-elf
RELEASE=rv64imc-3.0.0
ARCHIVE=riscv64-unknown-elf.gcc-12.1.0
echo "Checking $RELEASE : $ARCHIVE/$PREFIX..."
wget https://github.com/stnolting/riscv-gcc-prebuilt/releases/download/$RELEASE/$ARCHIVE.tar.gz
ls -al
mkdir $GITHUB_WORKSPACE/$ARCHIVE.tmp
tar -xzf $ARCHIVE.tar.gz -C $GITHUB_WORKSPACE/$ARCHIVE.tmp/
$GITHUB_WORKSPACE/$ARCHIVE.tmp/bin/$PREFIX-gcc -v

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
