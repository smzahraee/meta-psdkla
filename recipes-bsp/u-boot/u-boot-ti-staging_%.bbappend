FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append_j7-evm = " \
    file://0001-tiU21.01-PATCH-Optimal-QoS-Settings.patch \
    file://tiU12.01-arm-dts-k3-j721e-eaik-Add-updated-lp4ddr-config-of-4266MTs.patch \
    file://0001-arm-dts-k3-j721e-eaik-Fix-up-MAIN-R5FSS-cluster-to-S.patch \
"

SRC_URI_append_j7-evm-k3r5 = " \
    file://0001-tiU21.01-PATCH-Optimal-QoS-Settings.patch \
    file://tiU12.01-arm-dts-k3-j721e-eaik-Add-updated-lp4ddr-config-of-4266MTs.patch \
    file://0001-arm-dts-k3-j721e-eaik-Fix-up-MAIN-R5FSS-cluster-to-S.patch \
"

PR_append = "_psdkla_6"
