# riscv-gcc-prebuilt

[![license](https://img.shields.io/github/license/stnolting/riscv-gcc-prebuilt)](https://github.com/stnolting/riscv-gcc-prebuilt/blob/master/LICENSE)

**Prebuilt RISC-V GCC toolchains.** 

The toolchains were built according to the instructions on the [official RISC-V GNU Compiler Toolchain page](https://github.com/riscv/riscv-gnu-toolchain)
using **Ubuntu 20.04 LTS** on a **64-bit x86 machine** (actually on Ubuntu on Windows). The compressed toolchain archives are available as [releases](https://github.com/stnolting/riscv-gcc-prebuilt/releases) only.

:information_source: All toolchains support standard CPU extensions like `C` (compressed instructions) and `M` (hardware multiplier and divider).

:information_source: The [GitHub actions worklflow(s)](?) only test the toolchains (using `riscv32-unknown-elf-gcc -v`).

:information_source: These prebuilt toolchains are used by the [NEORV32 Processor](https://github.com/stnolting/neorv32) project.

:warning: The toolchain were build using the RISC-V extension configuration from the `march` column below. Keep in mind that – for instance – a `rv32imc` toolchain only provides library code compiled with compressed and `mul`/`div` instructions! Hence, this code cannot be executed (without emulation) on an architecture without these extensions! In contrast, a `rv32i` toolchain only reuqires the RISC-V `I` extension.


## Available Toolchains

| Toolchain             | Release (tag)    | Download archive | GCC | binutils | march   | mabi | clib |
|:---------------------:|:-----------------|:-----------------|:---:|:--------:|:-------:|:----:|:----:|
| `riscv32-unknown-elf` | [rv32i-1.0.0](https://github.com/stnolting/riscv-gcc-prebuilt/releases/tag/rv32i-1.0.0) | [download](https://github.com/stnolting/riscv-gcc-prebuilt/releases/download/rv32i-1.0.0/riscv32-unknown-elf.gcc-10.1.0.rv32i.ilp32.newlib.tar.gz) | `10.1.0` | `2.34` | `rv32i` | `ilp32`  | newlib |
| `riscv32-unknown-elf` | [rv32e-1.0.0](https://github.com/stnolting/riscv-gcc-prebuilt/releases/tag/rv32e-1.0.0) | [download](https://github.com/stnolting/riscv-gcc-prebuilt/releases/download/rv32e-1.0.0/riscv32-unknown-elf.gcc-10.1.0.rv32e.ilp32e.newlib.tar.gz) | `10.1.0` | `2.34` | `rv32e` | `ilp32e` | newlib |


## Downloading via Browser

Click on the according **download** link in the table above to directly download the archive of choice from the according [release page](https://github.com/stnolting/riscv-gcc-prebuilt/releases).


## Downloading via Command Line

You use `wget` to directly download a toolchain archive from the table above. Select the toolchain of choice, right-click on the **download** link, click "copy link address" and use that as argument for `wget`. Example:

    $ wget https://github.com/stnolting/riscv-gcc-prebuilt/releases/download/rv32i-1.0.0/riscv32-unknown-elf.gcc-10.1.0.rv32i.ilp32.newlib.tar.gz

:warning: A `git clone` of the repository will **not** include the relase assets (= the toolchain archives)!


## Installation

Create a folder where you want to install the toolchain, for example `/opt/riscv` (you will need `sudo` rights to create this folder and copy data to it).

    $ sudo mkdir /opt/riscv

Navigate to the download folder. Decompress your toolchain (`TOOLCHAIN` with your toolchain archive of choice). Again, you might have to use `sudo` to copy everything if your target directory is protected.

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

This project is released under the GPL-3.0 license. No copyright infringement intended.
Other implied or used projects might have different licensing - see their documentation to get more information.
