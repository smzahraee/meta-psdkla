FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:${THISDIR}/${PN}/${MACHINE}:"

SRC_URI_append_j7-evm = " \
    file://0001-arm64-dts-ti-Add-DTB-overlays-for-vision-apps-and-ed.patch \
    file://0001-arm64-dts-ti-k3-j721e-common-proc-board.dts-Add-the-.patch \
    file://0001-arm64-dts-dra82-Add-v4l2-vxd_dec-device-node.patch \
    file://0002-dt-bindings-Add-binding-for-img-d5500-vxd-for-DRA8x.patch \
    file://0003-v4l-vxd-dec-Create-mmu-programming-helper-library.patch \
    file://0004-v4l-vxd-dec-Create-vxd_dec-Mem-Manager-helper-librar.patch \
    file://0005-v4l-vxd-dec-Add-vxd-helper-library.patch \
    file://0006-v4l-vxd-dec-Add-IMG-VXD-Video-Decoder-mem-to-mem-dri.patch \
    file://0007-ti_config_fragments-multimedia.cfg-Add-video-decode.patch \
    file://0008-v4l-vxd-dec-Add-hardware-control-modules.patch \
    file://0009-vxd-dec-Add-vxd-core-module.patch \
    file://0010-v4l-vxd-dec-Add-translation-control-modules.patch \
    file://0011-v4l-vxd-dec-Add-utility-modules.patch \
    file://0012-v4l-vxd-dec-Add-TALMMU-module.patch \
    file://0013-v4l-vxd-dec-Add-VDEC-MMU-wrapper.patch \
    file://0014-v4l-vxd-dec-Add-Bistream-Preparser-BSPP-module.patch \
    file://0015-v4l-vxd-dec-Add-common-headers.patch \
    file://0016-v4l-vxd-dec-Add-firmware-inteface-headers.patch \
    file://0017-v4l-vxd-dec-Add-pool-api-modules.patch \
    file://0018-Video-Decoder-This-patch-implements-resource-manager.patch \
    file://0019-Video-Decoder-This-patch-implements-pixel-processing.patch \
    file://0020-v4l-vxd-dec-vdecdd-utility-library.patch \
    file://0021-v4l-vxd-dec-Decoder-resource-component.patch \
    file://0022-v4l-vxd-dec-Decoder-Core-Component.patch \
    file://0023-v4l-vxd-dec-vdecdd-headers-adde.patch \
    file://0024-v4l-vxd-dec-Decoder-Component.patch \
    file://0025-v4l-vxd-dec-Add-resource-manager.patch \
    file://0026-v4l-videodev2-Add-10bit-definitions-for-NV12-and-NV1.patch \
    file://0027-media-platform-Kconfig-Add-Video-decoder-kconfig-ent.patch \
    file://0028-decoder-MJPEG-Decoder-support-has-been-added.patch \
    file://0029-decoder-separate-V4L2-node-implementation-from-commo.patch \
"

KERNEL_DEVICETREE_append_j7-evm = " \
	ti/k3-j721e-vision-apps.dtbo \
	ti/k3-j721e-edgeai-apps.dtbo \
"

PR_append = "_psdkla_12"
