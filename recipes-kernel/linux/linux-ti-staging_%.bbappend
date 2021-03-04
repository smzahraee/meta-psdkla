FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:${THISDIR}/${PN}/${MACHINE}:"

SRC_URI_append_j7-evm = " \
    file://0001-arm64-dts-ti-Add-DTB-overlays-for-vision-apps-and-ed.patch \
    file://0001-arm64-dts-ti-k3-j721e-common-proc-board.dts-Add-the-.patch \
    file://0001-ti_config_fragments-Add-multimedia.cfg.patch \
    file://0002-v4l-videodev2-Add-10bit-definitions-for-NV12-and-NV1.patch \
    file://0003-drivers-media-platform-Kconfig-Add-Video-decoder-kco.patch \
    file://0004-arm64-dts-ti-k3-j721e-main.dtsi-Add-D5520-node.patch \
    file://0005-dt-bindings-Add-binding-for-img-d5520-vxd-for-J721E.patch \
    file://0006-drivers-media-platorm-Kconfig-Add-Video-encoder-kcon.patch \
    file://0007-arm64-dts-ti-k3-j721e-main.dtsi-Add-VXE384-node.patch \
    file://0008-dt-bindings-Add-binding-for-img-vxe384-for-J721E.patch \
    file://0009-ti_config_fragments-multimedia.cfg-Add-video-encode-.patch \
"

SRC_URI_append_j7200-evm = " \
    file://0002-DRA821A-Adding-DRA821A-emulation-dtbo.patch \
"

KERNEL_DEVICETREE_append_j7-evm = " \
	ti/k3-j721e-vision-apps.dtbo \
	ti/k3-j721e-edgeai-apps.dtbo \
"

KERNEL_DEVICETREE_append_j7200-evm = " \
	ti/k3-j7200-dra821a.dtbo \
"

PR_append = "_psdkla_8"
