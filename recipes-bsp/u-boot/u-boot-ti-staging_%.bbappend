FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append:k3 = " \
    file://0001-tiU21.01-arm-mach-k3-common-don-t-reconfigure-.patch \
"
SRC_URI:append:k3r5 = " \
    file://0001-tiU21.01-arm-mach-k3-common-don-t-reconfigure-.patch \
"

PR:append = "_psdkla_25"
