using Clang, Clang.LibClang
using CEnum

include("clanghelpers.jl")

ctx = DefaultContext()
const LabJack_header = joinpath(
    homedir(),
    "git",
    "LabJack.jl",
    "deps",
    "include",
    "LabJackM_nodep.h",
)
trans_unit = parse_header(
    LabJack_header,
    args = ["-fparse-all-comments"],
    flags = CXTranslationUnit_DetailedPreprocessingRecord,
)

ctx.libname = "liblabjackm"

push!(ctx.trans_units, trans_unit)
root_cursor = getcursor(trans_unit)
header = spelling(root_cursor)
ctx.children = children(root_cursor)

ctx.options["is_function_strictly_typed"] = true
ctx.options["is_struct_mutable"] = false

blacklist = ["unix", "linux", "LAB_JACK_M_HEADER"]


enums = Vector{CLCursor}()

for (i, child) in enumerate(ctx.children)
    # Cursor properties
    child_name = name(child)
    child_kind = kind(child)
    # ctx.children_index = i
    # Skip compiler constants/garbage and type aliasing
    child_kind == CXCursor_MacroInstantiation && continue
    startswith(child_name, "_") && continue
    startswith(child_name, "LJME_") && continue
    child_name ∈ blacklist && continue
    child_kind == CXCursor_TypedefDecl && continue
    child_kind == CXCursor_MacroDefinition && continue

    child_kind == CXCursor_VarDecl && (wrap!(ctx, child))
    child_kind ∈ (CXCursor_EnumDecl, CXCursor_EnumConstantDecl) && (push!(enums, child); continue)
    child_kind == CXCursor_FunctionDecl && wrap_fun!(ctx, child)
end


api_file = joinpath(@__DIR__, "liblabjackm_api.jl")
api_stream = open(api_file, "w")

println(api_stream, "# Julia wrapper for header: $(basename(header))")
println(api_stream, "# Automatically generated using Clang.jl\n")
print_buffer(api_stream, ctx.api_buffer)
empty!(ctx.api_buffer)
close(api_stream)
#=
common_file = joinpath(@__DIR__, "liblabjackm_common.jl")
open(common_file, "w") do f
    println(f, "# Automatically generated using Clang.jl\n")
    print_buffer(f, dump_to_buffer(ctx.common_buffer))
end
=#
