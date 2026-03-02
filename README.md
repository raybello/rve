# RVE - RISC V Emulator
Cross platform RISC V simulator


## Setup project
``` csh
git clone --recurse-submodules -j8 https://github.com/RaymondBello/rv32ima-linux.git
cd rv32ima-linux
```
Or
``` csh
git clone https://github.com/RaymondBello/rv32ima-linux.git
cd rv32ima-linux
git submodule update --init --recursive
```

## Adding submodules
``` csh
git submodule add -b <branch> <url> <path>
```

## Running Emulator
### Running RISCV ISA Tests
``` csh
make isas ISAFLAGS=-rse
```
### Running Emulator
``` csh
make run
```
### Building project without running
``` csh
make all
```
### Demo
<img src="docs/demo.gif" width="1200" >

