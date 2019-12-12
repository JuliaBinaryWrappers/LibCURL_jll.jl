# Autogenerated wrapper script for LibCURL_jll for x86_64-unknown-freebsd11.1
export libcurl, curl

using LibSSH2_jll
using MbedTLS_jll
using Zlib_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"

# Relative path to `libcurl`
const libcurl_splitpath = ["lib", "libcurl.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libcurl_path = ""

# libcurl-specific global declaration
# This will be filled out by __init__()
libcurl_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libcurl = "libcurl.so.4"


# Relative path to `curl`
const curl_splitpath = ["bin", "curl"]

# This will be filled out by __init__() for all products, as it must be done at runtime
curl_path = ""

# curl-specific global declaration
function curl(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(PATH, ':', ENV["PATH"])
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        if !isempty(get(ENV, LIBPATH_env, ""))
            env_mapping[LIBPATH_env] = string(LIBPATH, ':', ENV[LIBPATH_env])
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(curl_path)
    end
end


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"LibCURL")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # We first need to add to LIBPATH_list the libraries provided by Julia
    append!(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)])
    # From the list of our dependencies, generate a tuple of all the PATH and LIBPATH lists,
    # then append them to our own.
    foreach(p -> append!(PATH_list, p), (LibSSH2_jll.PATH_list, MbedTLS_jll.PATH_list, Zlib_jll.PATH_list,))
    foreach(p -> append!(LIBPATH_list, p), (LibSSH2_jll.LIBPATH_list, MbedTLS_jll.LIBPATH_list, Zlib_jll.LIBPATH_list,))

    global libcurl_path = normpath(joinpath(artifact_dir, libcurl_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libcurl_handle = dlopen(libcurl_path)
    push!(LIBPATH_list, dirname(libcurl_path))

    global curl_path = normpath(joinpath(artifact_dir, curl_splitpath...))

    push!(PATH_list, dirname(curl_path))
    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

