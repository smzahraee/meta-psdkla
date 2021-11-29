FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append_j7-evm = " \
    file://0001-tiU21.01-PATCH-Optimal-QoS-Settings.patch \
    file://0001-arm-dts-k3-j721e-sk-Fix-up-MAIN-R5FSS-cluster-to.patch \
"

SRC_URI_append_j7-evm-k3r5 = " \
    file://0001-tiU21.01-PATCH-Optimal-QoS-Settings.patch \
    file://0001-arm-dts-k3-j721e-sk-Fix-up-MAIN-R5FSS-cluster-to.patch \
"

PR_append = "_psdkla_11"
