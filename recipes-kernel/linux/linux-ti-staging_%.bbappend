FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:${THISDIR}/${PN}/${MACHINE}:"

SRC_URI_append_j7-evm = " \
    file://0001-arm64-dts-ti-Add-DTB-overlays-for-vision-apps-and-ed.patch \
    file://0001-arm64-dts-ti-k3-j721e-common-proc-board.dts-Add-the-.patch \
    file://0001-dma-buf-heaps-Initialize-during-core-instead-of-subs.patch \
    file://0002-dma-buf-heaps-Add-Carveout-heap-to-dmabuf-heaps.patch \
    file://0001-HACK-dt-bindings-misc-Add-ti-dma_buf_phys-bindig-doc.patch \
    file://0002-HACK-misc-Add-dma-buf-to-physical-address-exporter.patch \
    file://0001-HACK-dma-buf-heaps-carveout-Add-support-for-cached-c.patch \
    file://0001-dt-bindings-i2c-i2c-mux-pca954x-Convert-to-DT-schema.patch \
    file://0002-arm64-dts-ti-k3-j721e-main-Add-nodes-to-enable-CSI2-.patch \
    file://0003-arm64-dts-ti-k3-j721e-eaik-Add-overlay-for-CSI2-inte.patch \
    file://0004-arm64-dts-ti-k3-j721e-eaik-Add-DT-overlay-for-RPi-ca.patch \
    file://0005-phy-cdns-dphy-Add-common-module-reset-to-DPHY-RX.patch \
    file://0006-phy-dt-bindings-cdns-dphy-Add-j721e-dphy-compatible.patch \
    file://0007-arm64-dts-ti-k3-j721e-Update-compatible-for-DPHY.patch \
    file://0008-media-ti-j721e-csi2rx-Add-RAW8-and-RAW10-pixel-forma.patch \
    file://0009-media-cadence-Extend-format-to-support-RAW-data-for-.patch \
    file://0001-vision-apps-Disabling-ti_csi2rx0-from-vision-apps-ov.patch \
    file://0001-media-ti-j721e-csi2rx-Drain-DMA-when-dropping-frames.patch \
    file://0002-media-ti-j721e-csi2rx-reduce-max-frame-height-and-wi.patch \
"

KERNEL_DEVICETREE_append_j7-evm = " \
	ti/k3-j721e-vision-apps.dtbo \
	ti/k3-j721e-edgeai-apps.dtbo \
	ti/k3-j721e-eaik-csi2-ov5640.dtbo \
	ti/k3-j721e-eaik-rpi-cam-imx219.dtbo \
"

PR_append = "_psdkla_22"
