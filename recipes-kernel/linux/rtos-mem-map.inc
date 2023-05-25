FILESEXTRAPATHS_prepend := "${THISDIR}/linux-ti-staging/${MACHINE}:"

SRC_URI_append_j7-evm = " \
    file://0002-arm64-dts-ti-k3-j721e-sk-Add-additional-DDR-carveout.patch \
    file://0003-arm64-dts-ti-j721e-Add-dtbos-for-vision-apps-and-edg.patch \
    file://0004-arm64-dts-ti-k3-j721e-rtos-memory-map-CMA-DT-node.patch \
"
SRC_URI_append_j7-hs-evm = " \
    file://0002-arm64-dts-ti-k3-j721e-sk-Add-additional-DDR-carveout.patch \
    file://0003-arm64-dts-ti-j721e-Add-dtbos-for-vision-apps-and-edg.patch \
    file://0004-arm64-dts-ti-k3-j721e-rtos-memory-map-CMA-DT-node.patch \
"

SRC_URI_append_j721s2-evm = " \
    file://0001-arm64-dts-ti-j721s2-Add-dtbos-for-vision-apps-and-ed.patch \
    file://0002-arm64-dts-ti-k3-j721s2-rtos-memory-map-CMA-DT-node.patch \
"
SRC_URI_append_j721s2-hs-evm = " \
    file://0001-arm64-dts-ti-j721s2-Add-dtbos-for-vision-apps-and-ed.patch \
    file://0002-arm64-dts-ti-k3-j721s2-rtos-memory-map-CMA-DT-node.patch \
"

SRC_URI_append_j784s4-evm = " \
    file://0001-arm64-dts-ti-j784s4-Add-dtbos-for-vision-apps-and-ed.patch \
    file://0002-arm64-dts-ti-k3-j784s4-rtos-memory-map-CMA-DT-node.patch \
"
SRC_URI_append_j784s4-hs-evm = " \
    file://0001-arm64-dts-ti-j784s4-Add-dtbos-for-vision-apps-and-ed.patch \
    file://0002-arm64-dts-ti-k3-j784s4-rtos-memory-map-CMA-DT-node.patch \
"

PR_append = ".5"
