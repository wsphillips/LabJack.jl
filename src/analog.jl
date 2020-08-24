
function write_analog(name::String, value::T, dev::LJDevice=DEFAULT_LJDEVICE) where T <: Real
    value = Float32(value)
    LJM.eWriteName(dev.handle, name, value) |> errorcheck
end

function read_analog(name::String, dev::LJDevice=DEFAULT_LJDEVICE)
    value = Ref{Float64}()
    LJM.eReadName(dev.handle, name, value) |> errorcheck
    return Float32(value[])
end
