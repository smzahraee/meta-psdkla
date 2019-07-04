FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:${THISDIR}/${PN}/${MACHINE}:"

SRC_URI_append_j7-evm = " \
	file://0001-arm64-dts-ti-remote-VP0-clocks-from-ownership.patch\
	file://0002-ti_config_fragments-v8_ipc-enable-rpmsg_char.patch\
	file://0003-rpmsg-char-enhancements.patch\
	file://0004-arm64-dts-ti-add-auto-common-dt-overlay.patch\
"

KERNEL_DEVICETREE_append = " \
	ti/k3-j721e-auto-common.dtbo \
"

PR_append = "_psdkla"
