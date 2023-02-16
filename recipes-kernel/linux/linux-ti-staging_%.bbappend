FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:${THISDIR}/${PN}/${MACHINE}:"

SRC_URI_append_j7-evm = " \
    file://0002-ina226-Porting-to-5.10-branch.patch \
"
SRC_URI_append_j721s2-evm = " \
    file://0001-arch-arm64-dts-ti-Add-E1-compatible-DTB-and-DTBO-for.patch \
"

PR_append = "_psdkla_96"

require rtos-mem-map.inc
