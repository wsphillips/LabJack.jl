
function write_analog(name::String, value::T, dev::LJDevice=DefaultDev()) where T <: Real
    value = Float32(value)
    LJM.eWriteName(dev.handle, name, value) |> errorcheck
end

function read_analog(name::String, dev::LJDevice=DefaultDev())
    value = Ref{Float32}()
    LJM.eReadName(dev.handle, name, value) |> errorcheck
    return value[]
end
