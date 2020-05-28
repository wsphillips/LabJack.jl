
function write_digital(name::String, value::Integer, dev::LJDevice=DefaultDev())
    LJM.eWriteName(dev.handle, name, UInt16(value)) |> errorcheck
end

function read_digital(name::String, dev::LJDevice=DefaultDev())
    value = Ref{UInt16}()

    LJM.eReadName(dev.handle, name, value)

    return Int(value[])
end
