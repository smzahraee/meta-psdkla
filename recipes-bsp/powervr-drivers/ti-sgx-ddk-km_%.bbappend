FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:${THISDIR}/${PN}/${MACHINE}:"

SRC_URI += "file://0001-linux2-config-Fix-driver-config-for-5.10-kernel.patch"

PR_append = "_psdkla_6"
