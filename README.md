# riscv-gcc-prebuilt

[![license](https://img.shields.io/github/license/stnolting/riscv-gcc-prebuilt)](https://github.com/stnolting/riscv-gcc-prebuilt/blob/master/LICENSE)

**Prebuilt RISC-V GCC toolchains.** 

The toolchains were built according to the instructions on the [official RISC-V GNU Compiler Toolchain page](https://github.com/riscv/riscv-gnu-toolchain)
using **Ubuntu 20.04 LTS** on a **64-bit x86 machine** (actually on Ubuntu on Windows). The compressed toolchain archives are available as [releases](https://github.com/stnolting/riscv-gcc-prebuilt/releases) only.

:information_source: All toolchains support standard CPU extensions like `C` (compressed instructions) and `M` (hardware multiplier and divider).

:information_source: These prebuilt toolchains are used by the [NEORV32 Processor](https://github.com/stnolting/neorv32) project.

:warning: Keep in mind that – for instance – a `rv32imc` toolchain only provides library code compiled with compressed and
`mul`/`div` instructions! Hence, this code cannot be executed (without emulation) on an architecture without these extensions!


## Available Toolchains

| Toolchain             | Release (tag)    | GCC      | binutils | march   | mabi | lib |
|:---------------------:|:-----------------|:--------:|:--------:|:-------:|:----:|:---:|
| `riscv32-unknown-elf` | [rv32i-1.0.0](https://github.com/stnolting/riscv-gcc-prebuilt/releases/tag/rv32i-1.0.0) | `10.1.0` | `2.34` | `rv32i` | `ilp32`  | newlib |
| `riscv32-unknown-elf` | [rv32e-1.0.0](https://github.com/stnolting/riscv-gcc-prebuilt/releases/tag/rv32e-1.0.0) | `10.1.0` | `2.34` | `rv32e` | `ilp32e` | newlib |


## Downloading

Click on the according tag in the table above to download the archive of choice from the [release page](https://github.com/stnolting/riscv-gcc-prebuilt/releases).


## Installation

Create a folder where you want to install the toolchain, for example `/opt/riscv` (you will need `sudo` rights to create this folder and copy data to it).

    $ sudo mkdir /opt/riscv

Decompress your toolchain (replace *TOOLCHAIN* with your toolchain archive of choice). Again, you might have to use `sudo` to copy everything if your target directory is protected.

    $ sudo tar -xzf riscv_gcc_prebuilt/data/TOOLCHAIN.tar.gz -C /opt/riscv/

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
