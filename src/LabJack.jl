module LabJack

# External dependencies
using JSON3, OrderedCollections, DataStructures, PrettyTables

# LibLabJackM wrapper module
include("LJM/LJM.jl")
using .LJM
export LJM

# High-level API
include("util.jl")
include("device.jl")
include("analog.jl")
include("digital.jl")

# Common use LJM constants
export dtANY, T7, TSERIES, ctANY, USB, ETHERNET

# High-level types
export LJDevice
export lsdev, open, close, DefaultDev
export write_digital, read_digital
export write_analog, read_analo_digital
export write_analog, read_analog

global DEFAULT_LJDEVICE

function init_default()
    if lsdev(; quiet = true) !== nothing
        global DEFAULT_LJDEVICE = open(dtANY, ctANY)
    else
        @warn "No LabJack device found."
    end
end

end # module
