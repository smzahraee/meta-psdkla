FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:${THISDIR}/${PN}/${MACHINE}:"

SRC_URI_append_j7-evm = " \
    file://0002-ina226-Porting-to-5.10-branch.patch \
"

PR_append = "_psdkla_95"

require rtos-mem-map.inc
