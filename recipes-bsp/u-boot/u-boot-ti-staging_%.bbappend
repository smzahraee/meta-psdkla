FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append_j7-evm = " \
    file://0001-tiU21.01-PATCH-Optimal-QoS-Settings.patch \
    file://0001-HACK-arm-k3-j721e-sk-RPi-header-pins-set-to-default-.patch \
"

SRC_URI_append_j7-evm-k3r5 = " \
    file://0001-tiU21.01-PATCH-Optimal-QoS-Settings.patch \
    file://0001-HACK-arm-k3-j721e-sk-RPi-header-pins-set-to-default-.patch \
"

PR_append = "_psdkla_12"
