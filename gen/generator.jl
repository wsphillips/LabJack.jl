using Clang, Clang.LibClang
using CEnum

ctx = DefaultContext()

trans_unit = parse_header(joinpath(@__DIR__, "..", "deps", "include","LabJackM.h"),
                          args=["-fparse-all-comments"],
                          flags = CXTranslationUnit_DetailedPreprocessingRecord)

ctx.libname = "liblabjackm"

push!(ctx.trans_units, trans_unit)
root_cursor = getcursor(trans_unit)
header = spelling(root_cursor)
ctx.children = children(root_cursor)

ctx.options["is_function_strictly_typed"] = true
ctx.options["is_struct_mutable"] = false

blacklist = ["unix", "linux", "LAB_JACK_M_HEADER"]


nameskinds = Tuple{Any, Any}[]

for (i, child) in enumerate(ctx.children)
    # Cursor properties
    child_name = name(child)
    child_kind = kind(child)
    # ctx.children_index = i
    # Skip compiler constants/garbage and type aliasing
    startswith(child_name, "_") && continue
    child_name ∈ blacklist && continue
    push!(nameskinds,(child_name, child_kind))


end

api_file = joinpath(@__DIR__, "liblabjackm_api.jl")
api_stream = open(api_file, "w")

println(api_stream, "# Julia wrapper for header: $(basename(header))")
println(api_stream, "# Automatically generated using Clang.jl\n")
ctx.api_buffer = rewrite(ctx.api_buffer)
print_buffer(api_stream, ctx.api_buffer)
empty!(ctx.api_buffer)

common_file = joinpath(@__DIR__, "liblabjackm_common.jl")
open(common_file, "w") do f
    println(f, "# Automatically generated using Clang.jl\n")
    print_buffer(f, dump_to_buffer(ctx.common_buffer))
end