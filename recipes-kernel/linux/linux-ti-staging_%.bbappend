FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:${THISDIR}/${PN}/${MACHINE}:"

SRC_URI_append_j7-evm = " \
	file://0001-arm64-dts-ti-remote-VP0-clocks-from-ownership.patch\
"

PR_append = "_psdkla"
