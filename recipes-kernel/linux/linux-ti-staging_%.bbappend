FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:${THISDIR}/${PN}/${MACHINE}:"

SRC_URI_append_j7-evm = " \
    file://0001-Memory-map-updates-for-vision-apps.patch \
    file://0002-rpmsg-char-enhancements.patch \
    file://0003-ti_config_fragments-v8_ipc-enable-rpmsg_char.patch \
"

KERNEL_DEVICETREE_append = " \
	ti/k3-j721e-vision-apps.dtbo \
"

PR_append = "_psdkla"
