FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:${THISDIR}/${PN}/${MACHINE}:"

SRC_URI_append_j7-evm = " \
    file://0001-arm64-dts-ti-j721e-ina226-Porting-to-5.10-branch.patch \
"
SRC_URI_append_j7-hs-evm = " \
    file://0001-arm64-dts-ti-j721e-ina226-Porting-to-5.10-branch.patch \
"

SRC_URI_append_j721s2-evm = " \
    file://0001-arm64-dts-ti-k3-am68-sk-rpi-Override-main_gpio0-node.patch \
"
SRC_URI_append_j721s2-hs-evm = " \
    file://0001-arm64-dts-ti-k3-am68-sk-rpi-Override-main_gpio0-node.patch \
"

PR_append = "_psdkla_101"

require rtos-mem-map.inc
