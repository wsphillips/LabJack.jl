
# write functions

function Base.write(loc::String, val::Float64, dev::LJDevice=DefaultDev())

    LJM.eWriteName(dev.handle, loc, val)
    return
end

# read functions
function Base.read(loc::String, dev::LJDevice=DefaultDev())
    val = Ref{Float64}()
    LJM.eReadName(dev.handle, loc, val)
    return val[]
end

#TODO: either parse the header for LJM or use the JSON to get
# type information
