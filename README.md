# LibLabJack.jl
Julia interface to the LJM library, used to control LabJack DAQ devices. Only a few
convenience functions are provided for now (although a more thorough idiomatic Julia
interface may be implemented in the future). The full LJM C API is wrapped and callable from Julia
through functions available in the submodule `LJM`. (e.g. for the C function
`LJM_eWriteAddress` one can equivalently call `LJM.eWriteAddress`) For help with usage of low-level
functions, see LabJack's online [documentation for LJM](https://labjack.com/support/software/api/ljm), and the Julia documentation on
conventions used when calling [external C functions](https://docs.julialang.org/en/v1/manual/calling-c-and-fortran-code/).

## Installation
```julia
]add https://github.com/wsphillips/LabJack.jl
```
## Usage
Convenience functions for single register reading and writing are provided via
`read_digital`, `write_digital`, `read_analog`, `write_analog`. Extended functionality
(multi-address read/write, streaming, etc) is available by calling low-level `LJM` functions directly.

```julia
using LabJack
# To search for and open the first available LJ device on any connection type:
LabJack.init_default()

# Read a value from analog input
val = read_analog("AIN0")

# Write to an anlog output:
write_analog("DAC0", 2.5)

# Check the values of EIO digital registers:
bits = read_digital("EIO_STATE")

# Set the value of a digital register:
write_digital("EIO0", 1)
```
If you choose not to use `LabJack.init_default`, you may find the utility function `lsdev()`
useful. You can select a device by connection and device type, calling
`open(dt::LJDeviceType, ct::LJConnectionType)` where valid device and connection types are
found in the enumerations within `LJM/liblabjackm_common.jl`. Alternatively, to open devices
by more specific means (e.g. IP address) you will need to use `LJM.Open()` directly,
passing your own identifier string (see LJM documentation for details). 

Devices opened with the high-level `open(dt::LJDeviceType, ct::LJConnectionType)` function
can be used with the high-level convenience functions directly, by passing the returned
`LJDevice` object as the last argument. To use device handles opened with `LJM.Open()` with convenience functions, 
wrap the returned integer handle with `LabJack.LJDevice(handle)` first:

```julia
# automatic opening by device and connection type
dev = open(T7, ETHERNET)
write_analog("DAC0", 2.5, dev)

# or manually via identifier string:
handle = Ref{Cint}()
LJM.Open(dtANY, ctANY, "the_device_id", handle)
dev = LabJack.LJDevice(handle[])
# now use as you would otherwise...
```

