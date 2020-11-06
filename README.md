# VSCode-nRF52833-S140-Template

Visual Studio Code nRF52 (nRF52833, S140) project template for Windows. This template is based on some solutions from the following repository: <https://github.com/gera-k/VSC-Nordic-example>.

## Features

This template uses a modified `Makefile` from the nRF SDK and supports following features:

- automated `c_cpp_properties.json` generation for a PROPER InteliSense support (*Python*),
- build (*gcc-arm-none-eabi*),
- flash (*nrfjprog*),
- SoftDevices flash (*nrfjprog*),
- debugging (*Cortex Debug*),
- nRF SKD Configuration (*CMSIS Configuration Wizard*),
- SEGGER's Real Time Transfer console.

## Tools

In order to setup the environment following tools are needed to be installed:

- [Visual Studio Code](https://code.visualstudio.com/)
- [C/C++ Extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools) - InteliSense, and C/C++ support for VSCode,
- [Cortex-Debug](https://marketplace.visualstudio.com/items?itemName=marus25.cortex-debug) - ARM Cortex-M GDB Debugger support for VSCode
- [GNU Arm Embedded Toolchain](https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads) - a cross-compiler for ARM
- [xPack Windows Build Tools](https://github.com/xpack-dev-tools/windows-build-tools-xpack/releases) - GNU Build Tools for Windows
- [Nordic SDK v17.0.0 or above](https://www.nordicsemi.com/Software-and-tools/Software/nRF5-SDK/Download#infotabs) - software development kit for nRF52 Series SoCs
- [nRF Command Line Tools](https://www.nordicsemi.com/Software-and-tools/Development-Tools/nRF-Command-Line-Tools/Download#infotabs) - set of tools for development, programming and debugging of nRF52 SoCs
- [SEGGER J-Link Software](https://www.segger.com/downloads/jlink/) - set of tool to be used with J-Link probe
- [Python 3](https://www.python.org/downloads/) - to generate the `c_cpp_properties.json`
- [Java](https://java.com/en/) - to run the *CMSIS Configuration Wizard*

## How to setup

1. Install all the tools, note the paths.
2. Clone this repository.
3. Adjust `.bat` file to match your setup:
    - Set `NRF_SD_VER` with a SoftDevices version provided with your nRF SDK (see `<Nordic SDK>\components\softdevice\s140\hex`),
    - Set all tool paths.
4. Set *GNU Arm Embedded Toolchain* path and its version in `<Nordic SDK>\components\toolchain\gcc\Makefile.windows` file.

Additional step (not mandatory). Setup a convenient keyboard shortcut to run tasks in VSCode:

- Open VSCode, go to: *File* -> *Preferences* -> *Keyboard Shortcuts*
- Search for *Tasks: Run Task*
- Setup a preferred shortcut, e.g. `Ctrl+B` to match other popular IDEs

## Running

1. Run the `.bat` file to open the VSCode workspace.
2. Edit `SRC_FILES`, `INC_FOLDERS`, `CFLAGS` and `ASMFLAGS` of the `Makefile` to match your requirements (default ones are ok).
3. Run the *c_cpp_properties* task to generate a proper InteliSense input each time you edit the `Makefile`.
4. Run the *flash_softdevices* task - not flashing the SoftDevices can cause runtime errors.
5. Hit `F5` to start a build -> flash -> debug workflow.

## Tasks

Following tasks are configured for this VSCode template:

- *build*
- *clean*
- *flash* - flash the main binary
- *flash_softdevice* - flash the SoftDevices stack
- *erase* - erase flash
- *sdk_config* - run the *CMSIS Configuration Wizard*
- *rtt* - run the *Real Time Transfer console*
- *c_cpp_properties* - generate a `c_cpp_properties.json` based on the `Makefile`
