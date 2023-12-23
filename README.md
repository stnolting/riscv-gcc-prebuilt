# Prebuilt RISC-V GCC Toolchains for Linux

[![Test_Toolchains](https://img.shields.io/github/actions/workflow/status/stnolting/riscv-gcc-prebuilt/main.yml?branch=main&longCache=true&style=flat-square&label=Test%20Toolchains&logo=Github%20Actions&logoColor=fff)](https://github.com/stnolting/riscv-gcc-prebuilt/actions/workflows/main.yml)
[![license](https://img.shields.io/github/license/stnolting/riscv-gcc-prebuilt?longCache=true&style=flat-square)](https://github.com/stnolting/riscv-gcc-prebuilt/blob/main/LICENSE)

* [Available Toolchains](#available-toolchains)
* [Download](#download)
* [Installation](#installation)

The toolchains were built according to the instructions of the
[official RISC-V GNU Compiler Toolchain repository](https://github.com/riscv-collab/riscv-gnu-toolchain)
using **Ubuntu** on a **64-bit x86 machine** (actually on Ubuntu on Windows).
The provided toolchains _support_ all ratified and implemented ISA extensions (e.g. `A` and `Zicsr`).
These prebuilt toolchains are part of the [NEORV32 RISC-V Processor](https://github.com/stnolting/neorv32) project.

ℹ️ Platform-specific instructions for building the toolchain from scratch can be found in
[NEORV32 UG: Building The Toolchain From Scratch](https://stnolting.github.io/neorv32/ug/#_building_the_toolchain_from_scratch)


## Available Toolchains

Toolchain prefix: `riscv32-unknown-elf` or `riscv64-unknown-elf` (see the individual releases)

| Status | Release (tag) | Download | GCC | binutils | march | mabi | c-lib |
|:------:|:-------------:|:--------:|:---:|:--------:|:-----:|:----:|:-----:|
| :green_circle: | [rv32e-231223](https://github.com/stnolting/riscv-gcc-prebuilt/releases/tag/rv32e-231223) | [:floppy_disk: download](https://github.com/stnolting/riscv-gcc-prebuilt/releases/download/rv32e-231223/riscv32-unknown-elf.gcc-rve-13.2.0.tar.gz) | 13.2.0 | 2.41 | `rv32e` | `ilp32e` | newlib |
| :green_circle: | [rv32i-131023](https://github.com/stnolting/riscv-gcc-prebuilt/releases/tag/rv32i-131023) | [:floppy_disk: download](https://github.com/stnolting/riscv-gcc-prebuilt/releases/download/rv32i-131023/riscv32-unknown-elf.gcc-13.2.0.tar.gz) | 13.2.0 | 2.41 | `rv32i` | `ilp32` | newlib |
| :red_circle: | [rv32i-4.0.0](https://github.com/stnolting/riscv-gcc-prebuilt/releases/tag/rv32i-4.0.0) | [:floppy_disk: download](https://github.com/stnolting/riscv-gcc-prebuilt/releases/download/rv32i-4.0.0/riscv32-unknown-elf.gcc-12.1.0.tar.gz) | 12.1.0 | 2.39 | `rv32i` | `ilp32` | newlib |

:green_circle: active / recommended, :red_circle: outdated


## Download

:warning: Cloning this repository (via `git clone`)  will **not** include the release assets and will
**not include the actual toolchain archives**! The compressed toolchain archives (`.tar.gz`) are available as
[releases](https://github.com/stnolting/riscv-gcc-prebuilt/releases) _assets_ only.

### Via Browser

Click on the according **download** link in the table above to directly download the archive of choice
from the according [release page](https://github.com/stnolting/riscv-gcc-prebuilt/releases) via the release _assets_.

### Via Command Line

You can use `wget` to directly download a toolchain archive from the table above. Select the toolchain of
choice, right-click on the "download" link, click "copy link address" and use that as argument for `wget`. Example:

```bash
wget https://github.com/stnolting/riscv-gcc-prebuilt/releases/download/rv32i-4.0.0/riscv32-unknown-elf.gcc-12.1.0.tar.gz
```


## Installation

Create a folder where you want to install the toolchain, for example `/opt/riscv` (you might need
`sudo` to create this folder and copy data to it).

```bash
$ sudo mkdir /opt/riscv
```

Navigate to the download folder. Decompress your toolchain (replace `TOOLCHAIN` with your toolchain archive
of choice). Again, you might have to use `sudo` if your target directory is protected.

```bash
$ sudo tar -xzf TOOLCHAIN.tar.gz -C /opt/riscv/
```

Now add the toolchain's `bin` folder to your system's `PATH` environment variable.
Your can also add this line to your `.bashrc` if applicable.

```bash
$ export PATH=$PATH:/opt/riscv/bin
```

Test the toolchain:

```bash
$ riscv32-unknown-elf-gcc -v
Using built-in specs.
COLLECT_GCC=riscv32-unknown-elf-gcc
COLLECT_LTO_WRAPPER=/opt/riscv/libexec/gcc/riscv32-unknown-elf/12.1.0/lto-wrapper
Target: riscv32-unknown-elf
Configured with: /tmp/rv_gcc/riscv-gnu-toolchain/gcc/configure --target=riscv32-unknown-elf --prefix=/opt/riscv --disable-shared --disable-threads --enable-languages=c,c++ --with-pkgversion=g1ea978e3066 --with-system-zlib --enable-tls --with-newlib --with-sysroot=/opt/riscv/riscv32-unknown-elf --with-native-system-header-dir=/include --disable-libmudflap --disable-libssp --disable-libquadmath --disable-libgomp --disable-nls --disable-tm-clone-registry --src=/tmp/rv_gcc/riscv-gnu-toolchain/gcc --disable-multilib --with-abi=ilp32 --with-arch=rv32i --with-tune=rocket --with-isa-spec=2.2 'CFLAGS_FOR_TARGET=-Os   -mcmodel=medlow' 'CXXFLAGS_FOR_TARGET=-Os   -mcmodel=medlow'
Thread model: single
Supported LTO compression algorithms: zlib
gcc version 12.1.0 (g1ea978e3066)
```


## License

This project is released under the [GPL-2.0 license](https://github.com/stnolting/riscv-gcc-prebuilt/blob/master/LICENSE).
No copyright infringement intended.
Other implied or used projects might have different licensing - see their documentation to get more information.

#### Limitation of Liability for External Links

Our website contains links to the websites of third parties ("external links"). As the
content of these websites is not under our control, we cannot assume any liability for
such external content. In all cases, the provider of information of the linked websites
is liable for the content and accuracy of the information provided. At the point in time
when the links were placed, no infringements of the law were recognizable to us. As soon
as an infringement of the law becomes known to us, we will immediately remove the
link in question.
