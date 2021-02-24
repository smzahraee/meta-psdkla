FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:${THISDIR}/${PN}/${MACHINE}:"

SRC_URI_append_j7-evm = " \
    file://0001-Memory-map-updates-for-vision-apps.patch \
    file://0001-arm64-dts-ti-k3-j721e-common-proc-board.dts-Add-the-.patch \
"

SRC_URI_append_j7200-evm = " \
    file://0001-Memory-map-updates-for-vision-apps.patch \
    file://0002-DRA821A-Adding-DRA821A-emulation-dtbo.patch \
"

KERNEL_DEVICETREE_append_j7-evm = " \
	ti/k3-j721e-vision-apps.dtbo \
"

KERNEL_DEVICETREE_append_j7200-evm = " \
	ti/k3-j7200-dra821a.dtbo \
"

PR_append = "_psdkla_6"
