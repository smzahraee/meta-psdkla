FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:${THISDIR}/${PN}/${MACHINE}:"

SRC_URI_append_j7-evm = " \
    file://0001-arm64-dts-ti-Add-DTB-overlays-for-vision-apps-and-ed.patch \
    file://0001-arm64-dts-ti-k3-j721e-common-proc-board.dts-Add-the-.patch \
    file://0001-HACK-dt-bindings-misc-Add-ti-dma_buf_phys-bindig-doc.patch \
    file://0002-HACK-misc-Add-dma-buf-to-physical-address-exporter.patch \
    file://0001-HACK-dma-buf-heaps-carveout-Add-support-for-cached-c.patch \
    file://0001-arm64-dts-ti-Add-DTB-overlay-for-RPi-expansion-heade.patch \
    file://0001-arm64-dts-ti-k3-j721e-sk-Add-additional-DDR-carveout.patch \
    file://0001-arm64-dts-ti-k3-j721e-Add-PWM-nodes-to-SK-and-J721e-.patch \
    file://0002-arm64-dts-ti-k3-j721e-Enable-HW-PWM-channels-on-SK-p.patch \
    file://0001-HACK-Disabling-suspend-resume-feature.patch \
    file://0001-net-ethernet-ti-davinci_mdio-Add-workaround-for-erra.patch \
"

SRC_URI_append_j721s2-evm = " \
    file://0001-arm64-dts-ti-Add-DTB-overlay-for-vision-apps.patch \
    file://0001-HACK-dt-bindings-misc-Add-ti-dma_buf_phys-bindig-doc.patch \
    file://0002-HACK-misc-Add-dma-buf-to-physical-address-exporter.patch \
    file://0001-HACK-dma-buf-heaps-carveout-Add-support-for-cached-c.patch \
    file://0001-net-ethernet-ti-davinci_mdio-Add-workaround-for-erra.patch \
    file://0001-drivers-staging-media-wave5-updating-to-patch-set-v9.patch \
    file://0001-arm64-dts-ti-rtos-memory-map-Add-reserved-memory-nod.patch \
    file://0002-drivers-staging-media-wave5-applying-patches-on-top-.patch \
    file://0001-HACK-Disabling-suspend-resume-feature.patch \
"

SRC_URI_append_j7200-evm = " \
    file://0001-HACK-Disabling-suspend-resume-feature.patch \
    file://0001-net-ethernet-ti-davinci_mdio-Add-workaround-for-erra.patch \
"

KERNEL_DEVICETREE_append_j7-evm = " \
	ti/k3-j721e-vision-apps.dtbo \
	ti/k3-j721e-edgeai-apps.dtbo \
	ti/k3-j721e-sk-rpi-exp-header.dtbo \
	ti/k3-j721e-sk-csi2-ov5640.dtbo \
	ti/k3-j721e-sk-rpi-cam-imx219.dtbo \
	ti/k3-j721e-fpdlink-cpb-fusion.dtbo \
	ti/k3-j721e-fpdlink-imx390-cm-0-0.dtbo \
	ti/k3-j721e-fpdlink-imx390-cm-0-1.dtbo \
	ti/k3-j721e-fpdlink-imx390-cm-0-2.dtbo \
	ti/k3-j721e-fpdlink-imx390-cm-0-3.dtbo \
	ti/k3-j721e-fpdlink-imx390-cm-1-0.dtbo \
	ti/k3-j721e-fpdlink-imx390-cm-1-1.dtbo \
	ti/k3-j721e-fpdlink-imx390-cm-1-2.dtbo \
	ti/k3-j721e-fpdlink-imx390-cm-1-3.dtbo \
	ti/k3-j721e-fpdlink-imx390-rcm-0-0.dtbo \
	ti/k3-j721e-fpdlink-imx390-rcm-0-1.dtbo \
	ti/k3-j721e-fpdlink-imx390-rcm-0-2.dtbo \
	ti/k3-j721e-fpdlink-imx390-rcm-0-3.dtbo \
	ti/k3-j721e-fpdlink-imx390-rcm-1-0.dtbo \
	ti/k3-j721e-fpdlink-imx390-rcm-1-1.dtbo \
	ti/k3-j721e-fpdlink-imx390-rcm-1-2.dtbo \
	ti/k3-j721e-fpdlink-imx390-rcm-1-3.dtbo \
	ti/k3-j721e-fpdlink-sk-fusion.dtbo \
"

KERNEL_DEVICETREE_append_j721s2-evm = " \
    ti/k3-j721s2-vision-apps.dtbo \
"

PR_append = "_psdkla_60"
