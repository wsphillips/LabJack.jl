
# write functions

function Base.write(loc::String, val::Float64, dev::LJDevice=DEFAULT_LJDEVICE)
    LJM.eWriteName(dev.handle, loc, val) |> errorcheck
    return
end

# read functions
function Base.read(loc::String, dev::LJDevice=DEFAULT_LJDEVICE)
    val = Ref{Float64}()
    LJM.eReadName(dev.handle, loc, val) |> errorcheck
    return val[]
end

#TODO: either parse the header for LJM or use the JSON to get
# type information
