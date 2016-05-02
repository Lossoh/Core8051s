################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../drivers/CoreTimer/core_timer.c 

C_DEPS += \
./drivers/CoreTimer/core_timer.d 

RELS += \
./drivers/CoreTimer/core_timer.rel 


# Each subdirectory must supply rules for building sources it contributes
drivers/CoreTimer/%.rel: ../drivers/CoreTimer/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: SDCC Compiler'
	sdcc --debug --noinduction --nooverlay --no-peep -c -I"../" -I"../hal" -I"../hal/Core8051s/SDCC" -I"../drivers/CoreTimer" -I"../drivers/CoreWatchdog" -I"../drivers/CoreGPIO" -I"../drivers/CoreUARTapb" -I"../drivers/CoreInterrupt" --model-large -o"$@" "$<" && \
	sdcc --noinduction --nooverlay --no-peep -c -MM -I"../" -I"../hal" -I"../hal/Core8051s/SDCC" -I"../drivers/CoreTimer" -I"../drivers/CoreWatchdog" -I"../drivers/CoreGPIO" -I"../drivers/CoreUARTapb" -I"../drivers/CoreInterrupt" --model-large  "$<" >> $(@:%.rel=%.d)
	@echo 'Finished building: $<'
	@echo ' '



# Target-specific items to be cleaned up in this subdirectory.
clean::
	-$(RM) $(wildcard ./drivers/CoreTimer/*.adb) $(wildcard ./drivers/CoreTimer/*.asm) $(wildcard ./drivers/CoreTimer/*.cdb) $(wildcard ./drivers/CoreTimer/*.lnk) $(wildcard ./drivers/CoreTimer/*.lst) $(wildcard ./drivers/CoreTimer/*.mem) $(wildcard ./drivers/CoreTimer/*.map) $(wildcard ./drivers/CoreTimer/*.rst) $(wildcard ./drivers/CoreTimer/*.sym) 
