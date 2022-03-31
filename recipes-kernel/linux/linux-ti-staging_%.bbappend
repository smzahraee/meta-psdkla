FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:${THISDIR}/${PN}/${MACHINE}:"

SRC_URI_append_j7-evm = " \
    file://0001-arm64-dts-ti-Add-DTB-overlays-for-vision-apps-and-ed.patch \
    file://0001-arm64-dts-ti-k3-j721e-common-proc-board.dts-Add-the-.patch \
    file://0001-HACK-dt-bindings-misc-Add-ti-dma_buf_phys-bindig-doc.patch \
    file://0002-HACK-misc-Add-dma-buf-to-physical-address-exporter.patch \
    file://0001-HACK-dma-buf-heaps-carveout-Add-support-for-cached-c.patch \
    file://0001-media-ti-j721e-csi2rx-Set-the-data-size-shift-correc.patch \
    file://0002-media-ti-j721e-csi2rx-Add-RAW8-and-RAW10-pixel-forma.patch \
    file://0003-media-cadence-Extend-format-to-support-RAW-data-for-.patch \
    file://0001-arm64-dts-ti-Add-DTB-overlay-for-RPi-expansion-heade.patch \
    file://0001-arm64-dts-ti-k3-j721e-sk-Add-additional-DDR-carveout.patch \
    file://imx390-fpdlink.patch \
    file://0001-arm64-dts-ti-k3-j721e-Add-PWM-nodes-to-SK-and-J721e-.patch \
    file://0002-arm64-dts-ti-k3-j721e-Enable-HW-PWM-channels-on-SK-p.patch \
    file://0001-vxe-vxd-decoder-Fix-input-buffer-size.patch \
    file://0001-vxe-vxd-encoder-Fix-for-alignment-of-resolution.patch \
"

SRC_URI_append_j721s2-evm = " \
    file://0001-arm64-dts-ti-Add-DTB-overlay-for-vision-apps.patch \
    file://0001-HACK-dt-bindings-misc-Add-ti-dma_buf_phys-bindig-doc.patch \
    file://0002-HACK-misc-Add-dma-buf-to-physical-address-exporter.patch \
    file://0001-HACK-dma-buf-heaps-carveout-Add-support-for-cached-c.patch \
    file://0001-HACK-arm64-dts-ti-k3-j721s2-common-proc-board-Set-DP.patch \
"

KERNEL_DEVICETREE_append_j7-evm = " \
	ti/k3-j721e-vision-apps.dtbo \
	ti/k3-j721e-edgeai-apps.dtbo \
	ti/k3-j721e-sk-rpi-exp-header.dtbo \
	ti/k3-j721e-sk-csi2-ov5640.dtbo \
	ti/k3-j721e-sk-rpi-cam-imx219.dtbo \
	ti/k3-j721e-cpb-fpdlink-fusion.dtbo \
	ti/k3-j721e-cpb-fpdlink-imx390-cm-0-0.dtbo \
	ti/k3-j721e-cpb-fpdlink-imx390-cm-0-1.dtbo \
	ti/k3-j721e-cpb-fpdlink-imx390-cm-0-2.dtbo \
	ti/k3-j721e-cpb-fpdlink-imx390-cm-0-3.dtbo \
	ti/k3-j721e-cpb-fpdlink-imx390-cm-1-0.dtbo \
	ti/k3-j721e-cpb-fpdlink-imx390-cm-1-1.dtbo \
	ti/k3-j721e-cpb-fpdlink-imx390-cm-1-2.dtbo \
	ti/k3-j721e-cpb-fpdlink-imx390-cm-1-3.dtbo \
	ti/k3-j721e-cpb-fpdlink-imx390-rcm-0-0.dtbo \
	ti/k3-j721e-cpb-fpdlink-imx390-rcm-0-1.dtbo \
	ti/k3-j721e-cpb-fpdlink-imx390-rcm-0-2.dtbo \
	ti/k3-j721e-cpb-fpdlink-imx390-rcm-0-3.dtbo \
	ti/k3-j721e-cpb-fpdlink-imx390-rcm-1-0.dtbo \
	ti/k3-j721e-cpb-fpdlink-imx390-rcm-1-1.dtbo \
	ti/k3-j721e-cpb-fpdlink-imx390-rcm-1-2.dtbo \
	ti/k3-j721e-cpb-fpdlink-imx390-rcm-1-3.dtbo \
	ti/k3-j721e-sk-fpdlink-fusion.dtbo \
"

KERNEL_DEVICETREE_append_j721s2-evm = " \
    ti/k3-j721s2-vision-apps.dtbo \
"

PR_append = "_psdkla_45"
