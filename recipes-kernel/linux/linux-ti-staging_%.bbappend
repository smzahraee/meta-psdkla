FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:${THISDIR}/${PN}/${MACHINE}:"

SRC_URI_append_j7-evm = " \
    file://0001-arm64-dts-ti-Add-DTB-overlays-for-vision-apps-and-ed.patch \
    file://0001-arm64-dts-ti-k3-j721e-common-proc-board.dts-Add-the-.patch \
    file://0001-HACK-dt-bindings-misc-Add-ti-dma_buf_phys-bindig-doc.patch \
    file://0002-HACK-misc-Add-dma-buf-to-physical-address-exporter.patch \
    file://0001-HACK-dma-buf-heaps-carveout-Add-support-for-cached-c.patch \
    file://0001-media-ti-j721e-csi2rx-Add-RAW8-and-RAW10-pixel-forma.patch \
    file://0002-media-cadence-Extend-format-to-support-RAW-data-for-.patch \
    file://0001-arm64-dts-ti-Add-DTB-overlay-for-RPi-expansion-heade.patch \
    file://0001-media-platform-Makefile-Fix-build-failure-in-paralle.patch \
"

KERNEL_DEVICETREE_append_j7-evm = " \
	ti/k3-j721e-vision-apps.dtbo \
	ti/k3-j721e-edgeai-apps.dtbo \
	ti/k3-j721e-sk-rpi-exp-header.dtbo \
"

PR_append = "_psdkla_30"
