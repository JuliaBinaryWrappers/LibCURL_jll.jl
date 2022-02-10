# Autogenerated wrapper script for LibCURL_jll for x86_64-linux-musl
export curl, libcurl

using LibSSH2_jll
using Zlib_jll
using nghttp2_jll
using MbedTLS_jll
JLLWrappers.@generate_wrapper_header("LibCURL")
JLLWrappers.@declare_library_product(libcurl, "libcurl.so.4")
JLLWrappers.@declare_executable_product(curl)
function __init__()
    JLLWrappers.@generate_init_header(LibSSH2_jll, Zlib_jll, nghttp2_jll, MbedTLS_jll)
    JLLWrappers.@init_library_product(
        libcurl,
        "lib/libcurl.so",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@init_executable_product(
        curl,
        "bin/curl",
    )

    JLLWrappers.@generate_init_footer()
end  # __init__()
