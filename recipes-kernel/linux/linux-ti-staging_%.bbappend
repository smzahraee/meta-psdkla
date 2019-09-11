FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:${THISDIR}/${PN}/${MACHINE}:"

SRC_URI_append_j7-evm = " \
    file://0001-arm64-dts-ti-add-new-DT-overlays-for-automotive.patch \
    file://0002-ti_config_fragments-v8_baseport-Enable-CONFIG_UIO.patch \
    file://0003-arm64-dts-ti-remote-VP0-clocks-from-ownership.patch \
    file://0004-rpmsg-char-enhancements.patch \
    file://0005-ti_config_fragments-v8_ipc-enable-rpmsg_char.patch \
    file://0006-drm-panel-simple-Add-timing-for-dummy-display.patch \
    file://0007-HACK-dt-bindings-misc-Add-ti-dma_buf_phys-binding-do.patch \
    file://0008-HACK-misc-Add-dma-buf-to-physical-address-exporter.patch \
    file://0009-HACK-ti_config_fragments-baseport-Enable-DMA-BUF-exp.patch \
    file://0010-HACK-ti_config_fragments-v8_baseport-Enable-DMA-BUF-.patch \
    file://0011-arm64-dts-ti-k3-j721e-Add-support-for-pm2-som.patch \
"

KERNEL_DEVICETREE_append = " \
	ti/k3-j721e-auto-common.dtbo \
	ti/k3-j721e-vision-apps.dtbo \
	ti/k3-j721e-psdkla-apps.dtbo \
	ti/k3-j721e-proc-board-beta.dtb \
"

PR_append = "_psdkla"
