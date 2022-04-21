# Autogenerated wrapper script for LibCURL_jll for i686-linux-musl
export libcurl

using LibSSH2_jll
using Zlib_jll
using nghttp2_jll
using MbedTLS_jll
using Kerberos_krb5_jll
JLLWrappers.@generate_wrapper_header("LibCURL")
JLLWrappers.@declare_library_product(libcurl, "libcurl.so.4")
function __init__()
    JLLWrappers.@generate_init_header(LibSSH2_jll, Zlib_jll, nghttp2_jll, MbedTLS_jll, Kerberos_krb5_jll)
    JLLWrappers.@init_library_product(
        libcurl,
        "lib/libcurl.so",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@generate_init_footer()
end  # __init__()
