
module LJM
using CEnum

export LJDeviceType, LJConnectionType
export dtANY, T7, TSERIES, ctANY, USB, ETHERNET

include("liblabjackm_common.jl")
include("liblabjackm_api.jl")
end # module
