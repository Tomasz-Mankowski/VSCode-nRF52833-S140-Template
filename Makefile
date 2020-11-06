PROJECT_NAME     := nRF52833_S140
TARGETS          := nrf52833_xxaa
OUTPUT_DIRECTORY := _build

SDK_ROOT := $(NRF_SDK)
PROJ_DIR := .

$(OUTPUT_DIRECTORY)/nrf52833_xxaa.out: \
  LINKER_SCRIPT  := nRF52833_S140.ld

# Source files common to all targets
SRC_FILES += \
	$(PROJ_DIR)/Source/main.c \
	\
	$(SDK_ROOT)/modules/nrfx/mdk/system_nrf52833.c \
	\
	$(SDK_ROOT)/integration/nrfx/legacy/nrf_drv_uart.c \
	$(SDK_ROOT)/modules/nrfx/drivers/src/prs/nrfx_prs.c \
	$(SDK_ROOT)/modules/nrfx/drivers/src/nrfx_uart.c \
	$(SDK_ROOT)/modules/nrfx/drivers/src/nrfx_uarte.c \
	\
	$(SDK_ROOT)/components/libraries/util/app_error.c \
	$(SDK_ROOT)/components/libraries/util/app_error_handler_gcc.c \
	$(SDK_ROOT)/components/libraries/util/app_error_weak.c \
	$(SDK_ROOT)/components/libraries/fifo/app_fifo.c \
	$(SDK_ROOT)/components/libraries/uart/app_uart_fifo.c \
	$(SDK_ROOT)/components/libraries/util/app_util_platform.c \
	\
	$(SDK_ROOT)/external/segger_rtt/SEGGER_RTT.c \
	$(SDK_ROOT)/external/segger_rtt/SEGGER_RTT_Syscalls_GCC.c \
	$(SDK_ROOT)/external/segger_rtt/SEGGER_RTT_printf.c \
	\
	$(SDK_ROOT)/modules/nrfx/mdk/gcc_startup_nrf52833.S \
  
# Include folders common to all targets
INC_FOLDERS += \
	$(PROJ_DIR) \
	$(PROJ_DIR)/Config \
	\
	$(SDK_ROOT)/components/toolchain/cmsis/include \
	\
	$(SDK_ROOT)/integration/nrfx \
	$(SDK_ROOT)/integration/nrfx/legacy \
	\
	$(SDK_ROOT)/modules/nrfx \
	$(SDK_ROOT)/modules/nrfx/drivers/include \
	$(SDK_ROOT)/modules/nrfx/hal \
	$(SDK_ROOT)/modules/nrfx/mdk \
	\
	$(SDK_ROOT)/components \
	\
	$(SDK_ROOT)/components/softdevice/common \
	$(SDK_ROOT)/components/softdevice/s140/headers \
	$(SDK_ROOT)/components/softdevice/s140/headers/nrf52 \
	\
	$(SDK_ROOT)/components/libraries/util \
	$(SDK_ROOT)/components/libraries/delay \
	$(SDK_ROOT)/components/libraries/uart \
	$(SDK_ROOT)/components/libraries/fifo \
	$(SDK_ROOT)/components/libraries/log \
	$(SDK_ROOT)/components/libraries/log/src \
	$(SDK_ROOT)/components/libraries/experimental_section_vars \
	$(SDK_ROOT)/components/libraries/strerror \
	\
	$(SDK_ROOT)/components/ble/ble_advertising \
	$(SDK_ROOT)/components/ble/ble_dtm \
	$(SDK_ROOT)/components/ble/ble_link_ctx_manager \
	$(SDK_ROOT)/components/ble/ble_racp \
	$(SDK_ROOT)/components/ble/ble_services/ble_ancs_c \
	$(SDK_ROOT)/components/ble/ble_services/ble_ans_c \
	$(SDK_ROOT)/components/ble/ble_services/ble_bas \
	$(SDK_ROOT)/components/ble/ble_services/ble_bas_c \
	$(SDK_ROOT)/components/ble/ble_services/ble_cscs \
	$(SDK_ROOT)/components/ble/ble_services/ble_cts_c \
	$(SDK_ROOT)/components/ble/ble_services/ble_dfu \
	$(SDK_ROOT)/components/ble/ble_services/ble_dis \
	$(SDK_ROOT)/components/ble/ble_services/ble_gls \
	$(SDK_ROOT)/components/ble/ble_services/ble_hids \
	$(SDK_ROOT)/components/ble/ble_services/ble_hrs \
	$(SDK_ROOT)/components/ble/ble_services/ble_hrs_c \
	$(SDK_ROOT)/components/ble/ble_services/ble_hts \
	$(SDK_ROOT)/components/ble/ble_services/ble_ias \
	$(SDK_ROOT)/components/ble/ble_services/ble_ias_c \
	$(SDK_ROOT)/components/ble/ble_services/ble_lbs \
	$(SDK_ROOT)/components/ble/ble_services/ble_lbs_c \
	$(SDK_ROOT)/components/ble/ble_services/ble_lls \
	$(SDK_ROOT)/components/ble/ble_services/ble_nus \
	$(SDK_ROOT)/components/ble/ble_services/ble_nus_c \
	$(SDK_ROOT)/components/ble/ble_services/ble_rscs \
	$(SDK_ROOT)/components/ble/ble_services/ble_rscs_c \
	$(SDK_ROOT)/components/ble/ble_services/ble_tps \
	$(SDK_ROOT)/components/ble/common \
	$(SDK_ROOT)/components/ble/nrf_ble_gatt \
	$(SDK_ROOT)/components/ble/nrf_ble_qwr \
	$(SDK_ROOT)/components/ble/peer_manager \
	\
	$(SDK_ROOT)/external/segger_rtt \

# Libraries common to all targets
LIB_FILES += \

# Optimization flags
OPT = -O3 -g3
# Uncomment the line below to enable link time optimization
#OPT += -flto

# C flags common to all targets
CFLAGS += -DNRF52833_XXAA
CFLAGS += $(OPT)
CFLAGS += -D__nRF_FAMILY
CFLAGS += -DARM_MATH_CM4
CFLAGS += -DFLASH_PLACEMENT=1
CFLAGS += -DFLOAT_ABI_HARD
CFLAGS += -DINITIALIZE_USER_SECTIONS 
CFLAGS += -DNO_VTOR_CONFIG
CFLAGS += -DNRF_SD_BLE_API_VERSION=7 
CFLAGS += -DS140
CFLAGS += -DSOFTDEVICE_PRESENT
CFLAGS += -mcpu=cortex-m4
CFLAGS += -mthumb -mabi=aapcs
CFLAGS += -Wall
CFLAGS += -mfloat-abi=hard -mfpu=fpv4-sp-d16
# keep every function in a separate section, this allows linker to discard unused ones
CFLAGS += -ffunction-sections -fdata-sections -fno-strict-aliasing
CFLAGS += -fno-builtin -fshort-enums

# C++ flags common to all targets
CXXFLAGS += $(OPT)
# Assembler flags common to all targets
ASMFLAGS += -g3
ASMFLAGS += -mcpu=cortex-m4
ASMFLAGS += -mthumb -mabi=aapcs
ASMFLAGS += -mfloat-abi=hard -mfpu=fpv4-sp-d16
ASMFLAGS += -DNRF52833_XXAA
ASMFLAGS += -D__nRF_FAMILY
ASMFLAGS += -DARM_MATH_CM4
ASMFLAGS += -DFLASH_PLACEMENT=1
ASMFLAGS += -DFLOAT_ABI_HARD
ASMFLAGS += -DINITIALIZE_USER_SECTIONS 
ASMFLAGS += -DNO_VTOR_CONFIG
ASMFLAGS += -DNRF_SD_BLE_API_VERSION=7 
ASMFLAGS += -DS140
ASMFLAGS += -DSOFTDEVICE_PRESENT

# Linker flags
LDFLAGS += $(OPT)
LDFLAGS += -mthumb -mabi=aapcs -L$(SDK_ROOT)/modules/nrfx/mdk -T$(LINKER_SCRIPT)
LDFLAGS += -mcpu=cortex-m4
LDFLAGS += -mfloat-abi=hard -mfpu=fpv4-sp-d16
# let linker dump unused sections
LDFLAGS += -Wl,--gc-sections
# use newlib in nano version
LDFLAGS += --specs=nano.specs

nrf52833_xxaa: CFLAGS += -D__HEAP_SIZE=2048
nrf52833_xxaa: CFLAGS += -D__STACK_SIZE=2048
nrf52833_xxaa: ASMFLAGS += -D__HEAP_SIZE=2048
nrf52833_xxaa: ASMFLAGS += -D__STACK_SIZE=2048

# Add standard libraries at the very end of the linker input, after all objects
# that may need symbols provided by these libraries.
LIB_FILES += -lc -lnosys -lm


.PHONY: default help

# Default target - first one defined
default: nrf52833_xxaa

# Print all targets that can be built
help:
	@echo following targets are available:
	@echo		nrf52833_xxaa
	@echo		flash_softdevice
	@echo		sdk_config - starting external tool for editing sdk_config.h
	@echo		flash      - flashing binary

TEMPLATE_PATH := $(SDK_ROOT)/components/toolchain/gcc


include $(TEMPLATE_PATH)/Makefile.common

$(foreach target, $(TARGETS), $(call define_target, $(target)))

.PHONY: flash flash_softdevice erase c_cpp_properties

# Flash the program
flash: default
	@echo Flashing: $(OUTPUT_DIRECTORY)/nrf52833_xxaa.hex
	$(NRF_TOOLS)/nrfjprog -f nrf52 --program $(OUTPUT_DIRECTORY)/nrf52833_xxaa.hex --sectorerase
	$(NRF_TOOLS)/nrfjprog -f nrf52 --reset

# Flash softdevice
flash_softdevice:
	@echo Flashing: s140_nrf52_$(NRF_SD_VER)_softdevice.hex
	$(NRF_TOOLS)/nrfjprog -f nrf52 --program $(SDK_ROOT)/components/softdevice/s140/hex/s140_nrf52_$(NRF_SD_VER)_softdevice.hex --sectorerase
	$(NRF_TOOLS)/nrfjprog -f nrf52 --reset

erase:
	$(NRF_TOOLS)/nrfjprog -f nrf52 --eraseall

SDK_CONFIG_FILE := ./Config/sdk_config.h
CMSIS_CONFIG_TOOL := $(SDK_ROOT)/external_tools/cmsisconfig/CMSIS_Configuration_Wizard.jar
sdk_config:
	$(JAVA)/java -jar $(CMSIS_CONFIG_TOOL) $(SDK_CONFIG_FILE)

INC_FOLDER_COUNT := $(words $(INC_FOLDERS))
c_cpp_properties:
	$(PYTHON_3)/python c_cpp_properties.py $(PROJECT_NAME) $(CC) $(INC_FOLDER_COUNT) $(INC_FOLDERS) $(CFLAGS) 