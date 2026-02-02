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
<img src=".vscode/Screen Recording 2026-02-01 at 10.01.06 PM.gif" width="1200" >

