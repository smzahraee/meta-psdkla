FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:${THISDIR}/${PN}/${MACHINE}:"

SRC_URI_append_j7-evm = " \
    file://0001-arm64-dts-ti-Add-DTB-overlays-for-vision-apps-and-ed.patch \
    file://0002-ina226-Porting-to-5.10-branch.patch \
    file://0003-arm64-dts-ti-k3-j721e-sk-Add-additional-DDR-carveout.patch \
    file://0004-ti_config_fragments-v8_audio_display-Decrease-CMA-to.patch \
"

SRC_URI_append_j721s2-evm = " \
    file://0001-arm64-dts-ti-Add-DTB-overlay-for-vision-apps.patch \
    file://0004-arm64-dts-ti-k3-j721s2-Add-overlay-for-edge-ai.patch \
"

SRC_URI_append_j784s4-evm = " \
    file://0001-arm64-dts-ti-Add-DTB-overlay-for-vision-apps.patch \
    file://0002-arm64-dts-ti-k3-j784s4-Add-overlay-for-edge-ai.patch \
"
PR_append = "_psdkla_90"
