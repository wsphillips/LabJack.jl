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
include("io.jl")

# Common use LJM constants
export dtANY, T7, TSERIES, ctANY, USB, ETHERNET

# High-level types

export LJDevice
export lsdev, open, close, DefaultDev
export write, read
end # module
