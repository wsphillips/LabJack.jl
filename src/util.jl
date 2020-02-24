
function errorcheck(error::Integer)
    Int(error) == 0 && return nothing
    str = String()
    ErrorToString(error, str)

    error > 0 && @warn str
    error < 0 && throw(str)
    return nothing
end
