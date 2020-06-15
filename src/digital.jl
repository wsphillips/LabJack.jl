
function write_digital(name::String, value::Integer, dev::LJDevice=DEFAULT_LJDEVICE)
    LJM.eWriteName(dev.handle, name, UInt16(value)) |> errorcheck
end

function read_digital(name::String, dev::LJDevice=DEFAULT_LJDEVICE)
    value = Ref{Float64}()

    LJM.eReadName(dev.handle, name, value)

    return digits(UInt16(value[]), base = 2, pad = 8)
end

function read_digital(address::Integer, dev::LJDevice=DEFAULT_LJDEVICE)

    value = Ref{Float64}()

    LJM.eReadAddress(dev.handle, Cint(address), Cint(0), value) 
    return digits(UInt16(value[]), base=2, pad = 8)
end


