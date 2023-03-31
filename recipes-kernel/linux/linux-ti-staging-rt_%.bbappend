FILESEXTRAPATHS_prepend := "${THISDIR}/linux-ti-staging:${THISDIR}/linux-ti-staging/${MACHINE}:"

SRC_URI_append_j7-evm = " \
    file://0001-arm64-dts-ti-j721e-ina226-Porting-to-5.10-branch.patch \
"
SRC_URI_append_j7-hs-evm = " \
    file://0001-arm64-dts-ti-j721e-ina226-Porting-to-5.10-branch.patch \
"

SRC_URI_append_j721s2-evm = " \
    file://0001-arch-arm64-dts-ti-Add-E1-compatible-DTB-and-DTBO-for.patch \
"
SRC_URI_append_j721s2-hs-evm = " \
    file://0001-arch-arm64-dts-ti-Add-E1-compatible-DTB-and-DTBO-for.patch \
"

PR_append = "_psdkla_98"

require rtos-mem-map.inc
