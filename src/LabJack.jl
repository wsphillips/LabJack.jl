module LabJack

include("LJM/LJM.jl")
using .LJM
include("util.jl")
include("device.jl")
include("io.jl")
export LJM
export dtANY, T7, TSERIES, ctANY, USB, ETHERNET

export lsdev, open, close, DefaultDev
export write, read
end # module
