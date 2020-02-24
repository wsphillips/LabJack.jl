# Device query/info/open/close

struct LJDevice
    handle::Cint
end

function lsdev(dt::LJDeviceType=dtANY, ct::LJConnectionType=ctANY)

    found = Ref{Int32}()
    devtypes = Vector{Int32}(undef, LJM.LIST_ALL_SIZE)
    ctypes = Vector{Int32}(undef, LJM.LIST_ALL_SIZE)
    serials = Vector{Int32}(undef, LJM.LIST_ALL_SIZE)
    ips = Vector{Int32}(undef, LJM.LIST_ALL_SIZE)

    LJM.ListAll(dt,ct,found,devtypes,ctypes,serials,ips) |> errorcheck

    found[] == Int32(0) && return nothing

    for i in 1:found[]
        println("\n[Device #", i, "]")
        println("\tDevice type:     ", LJDeviceType(devtypes[i]))
        println("\tConnection type: ", LJConnectionType(ctypes[i]))
        println("\tSerial number:   ", serials[i])
        println("\tIP Address:      ", ips[i])
    end
end

function Base.open(dt::LJDeviceType, ct::LJConnectionType)
    handle = Ref{Cint}()
    LJM.Open(dt, ct, "ANY", handle) |> errorcheck
    return LJDevice(handle[])
end

function Base.close(dev::LJDevice)
    LJM.Close(dev.handle) |> errorcheck
    dev = nothing
    return
end

DefaultDev() = open(dtANY, ctANY)
