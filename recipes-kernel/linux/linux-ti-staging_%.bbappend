FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:${THISDIR}/${PN}/${MACHINE}:"

SRC_URI_append_j7-evm = " \
    file://0001-arm64-dts-ti-Add-DTB-overlays-for-vision-apps-and-ed.patch \
    file://0001-arm64-dts-ti-k3-j721e-common-proc-board.dts-Add-the-.patch \
    file://0001-arm64-dts-ti-Add-DTB-overlay-for-RPi-expansion-heade.patch \
    file://0001-arm64-dts-ti-k3-j721e-sk-Add-additional-DDR-carveout.patch \
    file://0001-arm64-dts-ti-k3-j721e-Add-PWM-nodes-to-SK-and-J721e-.patch \
    file://0002-arm64-dts-ti-k3-j721e-Enable-HW-PWM-channels-on-SK-p.patch \
    file://0001-arm64-dts-ti-j721e-rtos-memory-map-Moving-all-C7x-me.patch \
    file://0001-ti_config_fragments-audio_display-Decrease-CMA-to-40.patch \
    file://0001-arm64-dts-ti-k3-j721e-sk-rpi-cam-imx219-Set-the-pinm.patch \
"

SRC_URI_append_j721s2-evm = " \
    file://0001-arm64-dts-ti-Add-DTB-overlay-for-vision-apps.patch \
    file://0001-drivers-staging-media-wave5-updating-to-patch-set-v9.patch \
    file://0001-arm64-dts-ti-j721s2-rtos-memory-map-Moving-all-C7x-h.patch \
"


PR_append = "_psdkla_65"
