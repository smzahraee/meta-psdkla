FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRCREV_j7-evm = "d77252021a85c72d7ff9a4e151b81c4b4b9e1205"

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

PR_append = "_psdkla_9"
