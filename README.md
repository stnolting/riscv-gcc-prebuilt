# riscv-gcc-prebuilt

[![Test Toolchains](https://github.com/stnolting/riscv-gcc-prebuilt/workflows/Test%20Toolchains/badge.svg)](https://github.com/stnolting/riscv-gcc-prebuilt/actions)
[![Downloads](https://img.shields.io/github/downloads/stnolting/riscv-gcc-prebuilt/total)](https://github.com/stnolting/riscv-gcc-prebuilt/releases)
[![license](https://img.shields.io/github/license/stnolting/riscv-gcc-prebuilt)](https://github.com/stnolting/riscv-gcc-prebuilt/blob/master/LICENSE)

**Prebuilt RISC-V GCC toolchains.** 

The toolchains were built according to the instructions on the [official RISC-V GNU Compiler Toolchain page](https://github.com/riscv/riscv-gnu-toolchain)
using **Ubuntu 20.04 LTS** on a **64-bit x86 machine** (actually on Ubuntu on Windows). The compressed toolchain archives are available as [releases](https://github.com/stnolting/riscv-gcc-prebuilt/releases) only.

:warning: The toolchain were build using the RISC-V extension configuration from the `march` column below. Keep in mind that – for instance – a `rv32imc` toolchain only provides library code compiled with compressed and `mul`/`div` instructions! Hence, this code cannot be executed (without emulation) on an architecture without these extensions! In contrast, a `rv32i` toolchain only reuqires the RISC-V `I` extension.

:information_source: All toolchains support standard CPU extensions like `C` (compressed instructions) and `M` (hardware multiplier and divider).

:octocat: The [GitHub actions worklflow](https://github.com/stnolting/riscv-gcc-prebuilt/actions) only *tests* the toolchains (using `riscv32-unknown-elf-gcc -v`).

:wrench: These prebuilt toolchains are used by the [NEORV32 Processor project](https://github.com/stnolting/neorv32).


## Available Toolchains

Toolchain prefix: `riscv32-unknown-elf`

| Release (tag)    | Download archive | GCC | binutils | march   | mabi | clib |
|:-----------------|:-----------------|:---:|:--------:|:-------:|:----:|:----:|
| [rv32i-2.0.0](https://github.com/stnolting/riscv-gcc-prebuilt/releases/tag/rv32i-2.0.0) | [:floppy_disk: download](https://github.com/stnolting/riscv-gcc-prebuilt/releases/download/rv32i-2.0.0/riscv32-unknown-elf.gcc-10.2.0.rv32i.ilp32.newlib.tar.gz) (.tar.gz) | `10.2.0` | `2.35` | `rv32i` | `ilp32`  | `newlib` |
| [rv32i-1.0.0](https://github.com/stnolting/riscv-gcc-prebuilt/releases/tag/rv32i-1.0.0) | [:floppy_disk: download](https://github.com/stnolting/riscv-gcc-prebuilt/releases/download/rv32i-1.0.0/riscv32-unknown-elf.gcc-10.1.0.rv32i.ilp32.newlib.tar.gz) (.tar.gz) | `10.1.0` | `2.34` | `rv32i` | `ilp32`  | `newlib` |
| [rv32e-1.0.0](https://github.com/stnolting/riscv-gcc-prebuilt/releases/tag/rv32e-1.0.0) | [:floppy_disk: download](https://github.com/stnolting/riscv-gcc-prebuilt/releases/download/rv32e-1.0.0/riscv32-unknown-elf.gcc-10.1.0.rv32e.ilp32e.newlib.tar.gz) (.tar.gz) | `10.1.0` | `2.34` | `rv32e` | `ilp32e` | `newlib` |


## Downloading via Browser

Click on the according **download** link in the table above to directly download the archive of choice from the according [release page](https://github.com/stnolting/riscv-gcc-prebuilt/releases).


## Downloading via Command Line

You use `wget` to directly download a toolchain archive from the table above. Select the toolchain of choice, right-click on the **download** link, click "copy link address" and use that as argument for `wget`. Example:

    $ wget https://github.com/stnolting/riscv-gcc-prebuilt/releases/download/rv32i-1.0.0/riscv32-unknown-elf.gcc-10.1.0.rv32i.ilp32.newlib.tar.gz

:warning: A `git clone` of the repository will **not** include the relase assets (= the toolchain archives)!

:warning: Download using `wget` might take a while if you are outside the US. Consider [direct downloading](https://github.com/stnolting/riscv-gcc-prebuilt/releases) via your browser.


## Installation

Create a folder where you want to install the toolchain, for example `/opt/riscv` (you will need `sudo` rights to create this folder and copy data to it).

    $ sudo mkdir /opt/riscv

Navigate to the download folder. Decompress your toolchain (replace `TOOLCHAIN` with your toolchain archive of choice). Again, you might have to use `sudo` if your target directory is protected.

    $ sudo tar -xzf TOOLCHAIN.tar.gz -C /opt/riscv/

Now add the toolchain's `bin` folder to your system's `PATH` environment variable (or add this line to your `.bashrc` if applicable):

    $ export PATH=$PATH:/opt/riscv/bin

Test the toolchain:

    $ riscv32-unknown-elf-gcc -v


## Required Shared Libraries

```
$ ldd /opt/riscv32i/bin/riscv32-unknown-elf-gcc
    linux-vdso.so.1
    libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6
    /lib64/ld-linux-x86-64.so.2
```

## License

This project is released under the [GPL-2.0 license](https://github.com/stnolting/riscv-gcc-prebuilt/blob/master/LICENSE). No copyright infringement intended.
Other implied or used projects might have different licensing - see their documentation to get more information.

#### Limitation of Liability for External Links

Our website contains links to the websites of third parties ("external links"). As the
content of these websites is not under our control, we cannot assume any liability for
such external content. In all cases, the provider of information of the linked websites
is liable for the content and accuracy of the information provided. At the point in time
when the links were placed, no infringements of the law were recognisable to us. As soon
as an infringement of the law becomes known to us, we will immediately remove the
link in question.
