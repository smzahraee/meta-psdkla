FILESEXTRAPATHS_prepend := "${THISDIR}/linux-ti-staging/${MACHINE}:"

SRC_URI_append_j721s2-evm = " \
    file://0001-arch-arm64-dts-ti-Add-E1-compatible-DTB-and-DTBO-for.patch \
"

PR_append = "_psdkla_1"

require rtos-mem-map.inc
