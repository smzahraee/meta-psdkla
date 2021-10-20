FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:${THISDIR}/${PN}/${MACHINE}:"

SRC_URI_append_j7-evm = " \
    file://0001-arm64-dts-ti-Add-DTB-overlays-for-vision-apps-and-ed.patch \
    file://0001-arm64-dts-ti-k3-j721e-common-proc-board.dts-Add-the-.patch \
    file://0001-dma-buf-heaps-Initialize-during-core-instead-of-subs.patch \
    file://0002-dma-buf-heaps-Add-Carveout-heap-to-dmabuf-heaps.patch \
    file://0001-HACK-dt-bindings-misc-Add-ti-dma_buf_phys-bindig-doc.patch \
    file://0002-HACK-misc-Add-dma-buf-to-physical-address-exporter.patch \
    file://0001-HACK-dma-buf-heaps-carveout-Add-support-for-cached-c.patch \
    file://0001-media-ti-j721e-csi2rx-Add-RAW8-and-RAW10-pixel-forma.patch \
    file://0002-media-cadence-Extend-format-to-support-RAW-data-for-.patch \
"

KERNEL_DEVICETREE_append_j7-evm = " \
	ti/k3-j721e-vision-apps.dtbo \
	ti/k3-j721e-edgeai-apps.dtbo \
"

PR_append = "_psdkla_27"
