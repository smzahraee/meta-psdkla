FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:${THISDIR}/${PN}/${MACHINE}:"

SRC_URI_append_j7-evm = " \
    file://0001-arm64-dts-ti-add-new-DT-overlays-for-automotive.patch \
    file://0002-ti_config_fragments-v8_baseport-Enable-CONFIG_UIO.patch \
"

KERNEL_DEVICETREE_append = " \
	ti/k3-j721e-auto-common.dtbo \
	ti/k3-j721e-vision-apps.dtbo \
"

PR_append = "_psdkla"
