FILESEXTRAPATHS_prepend := "${THISDIR}/linux-ti-staging:${THISDIR}/linux-ti-staging/${MACHINE}:"

SRC_URI_append_j7-evm = " \
    file://0001-arm64-dts-ti-j721e-ina226-Porting-to-5.10-branch.patch \
"
SRC_URI_append_j7-hs-evm = " \
    file://0001-arm64-dts-ti-j721e-ina226-Porting-to-5.10-branch.patch \
"

PR_append = "_psdkla_99"

require rtos-mem-map.inc
