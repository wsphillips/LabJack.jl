# These functions are excluded until the register map can be parsed automatically,
# and package-specific types are defined to avoid potential type piracy with Base.
# write functions
function Base.write(loc::String, val, dev::LJDevice=DEFAULT_LJDEVICE)
    # look-up datatype for register, convert `val` then call:
    LJM.eWriteName(dev.handle, loc, val) |> errorcheck
    return
end

# read functions
function Base.read(loc::String, dev::LJDevice=DEFAULT_LJDEVICE)
    val = Ref{Float64}() # all read values are written into a 64-bit word
    LJM.eReadName(dev.handle, loc, val) |> errorcheck
    # convert return value to appropriate type based on register data type 
    # instead of returning the unloaded Ref value.
    return val[]
end
