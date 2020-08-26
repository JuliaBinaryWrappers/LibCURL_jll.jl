module LibCURL_jll
using Libdl

export libcurl

# These get calculated in __init__()
libcurl_handle = C_NULL
libcurl_path = ""

if Sys.iswindows()
    const libcurl = "libcurl-4.dll"
elseif Sys.isapple()
    const libcurl = "libcurl.4.dylib"
else
    const libcurl = "libcurl.so"
end

function __init__()
    global libcurl_handle = dlopen(libcurl)
    global libcurl_path = dlpath(libcurl_handle)
end

end  # module LibCURL_jll
