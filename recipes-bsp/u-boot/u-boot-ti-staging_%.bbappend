FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append_k3 = " \
    file://0001-tiU21.01-arm-mach-k3-common-don-t-reconfigure-.patch \
"
SRC_URI_append_k3r5 = " \
    file://0001-tiU21.01-arm-mach-k3-common-don-t-reconfigure-.patch \
"

PR_append = "_psdkla_24"
