
module LJM
using CEnum

export LJDeviceType, LJConnectionType
export dtANY, T7, TSERIES, ctANY, USB, ETHERNET
import Base.cconvert
include("liblabjackm_common.jl")

Base.cconvert(::Type{Ref{Int32}}, a::Array{LJMDataType}) = Base.cconvert(Ref{Int32}, Cint.(a))

include("liblabjackm_api.jl")
end # module
