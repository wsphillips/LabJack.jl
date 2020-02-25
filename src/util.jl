
function errorcheck(error::Integer)
    error == 0 && return nothing
    str = " "^Int(LJM.MAX_NAME_SIZE)
    LJM.ErrorToString(error, str)
    error > 0 && @warn unsafe_string(pointer(str))
    error < 0 && throw(unsafe_string(pointer(str)))
    return nothing
end

function getaddress(name::String)
end
