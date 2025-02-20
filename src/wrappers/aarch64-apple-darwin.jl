# Autogenerated wrapper script for LibCURL_jll for aarch64-apple-darwin
export libcurl

using LibSSH2_jll
using Zlib_jll
using nghttp2_jll
using OpenSSL_jll
JLLWrappers.@generate_wrapper_header("LibCURL")
JLLWrappers.@declare_library_product(libcurl, "@rpath/libcurl.4.dylib")
function __init__()
    JLLWrappers.@generate_init_header(LibSSH2_jll, Zlib_jll, nghttp2_jll, OpenSSL_jll)
    JLLWrappers.@init_library_product(
        libcurl,
        "lib/libcurl.4.dylib",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@generate_init_footer()
end  # __init__()
