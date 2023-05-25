FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:${THISDIR}/${PN}/${MACHINE}:"

SRC_URI_append_j7-evm = " \
    file://0001-arm64-dts-ti-j721e-ina226-Porting-to-5.10-branch.patch \
"
SRC_URI_append_j7-hs-evm = " \
    file://0001-arm64-dts-ti-j721e-ina226-Porting-to-5.10-branch.patch \
"

SRC_URI_append_j721s2-evm = " \
    file://0001-arch-arm64-dts-ti-Add-E1-compatible-DTB-and-DTBO-for.patch \
    file://0001-dt-bindings-dma-ti-Add-bindings-for-J721S2-BCDMA.patch \
    file://0002-dmaengine-ti-k3-udma-Add-support-for-J721S2-CSI-BCDM.patch \
    file://0003-arm64-dts-ti-k3-j721s2-main-Enable-BCDMA-instance-fo.patch \
    file://0004-arm64-dts-ti-k3-j784s4-main-Enable-BCDMA-instance-fo.patch \
"
SRC_URI_append_j721s2-hs-evm = " \
    file://0001-arch-arm64-dts-ti-Add-E1-compatible-DTB-and-DTBO-for.patch \
    file://0001-dt-bindings-dma-ti-Add-bindings-for-J721S2-BCDMA.patch \
    file://0002-dmaengine-ti-k3-udma-Add-support-for-J721S2-CSI-BCDM.patch \
    file://0003-arm64-dts-ti-k3-j721s2-main-Enable-BCDMA-instance-fo.patch \
    file://0004-arm64-dts-ti-k3-j784s4-main-Enable-BCDMA-instance-fo.patch \
"

SRC_URI_append_j784s4-evm = " \
    file://0001-dt-bindings-dma-ti-Add-bindings-for-J721S2-BCDMA.patch \
    file://0002-dmaengine-ti-k3-udma-Add-support-for-J721S2-CSI-BCDM.patch \
    file://0003-arm64-dts-ti-k3-j721s2-main-Enable-BCDMA-instance-fo.patch \
    file://0004-arm64-dts-ti-k3-j784s4-main-Enable-BCDMA-instance-fo.patch \
"
SRC_URI_append_j784s4-hs-evm = " \
    file://0001-dt-bindings-dma-ti-Add-bindings-for-J721S2-BCDMA.patch \
    file://0002-dmaengine-ti-k3-udma-Add-support-for-J721S2-CSI-BCDM.patch \
    file://0003-arm64-dts-ti-k3-j721s2-main-Enable-BCDMA-instance-fo.patch \
    file://0004-arm64-dts-ti-k3-j784s4-main-Enable-BCDMA-instance-fo.patch \
"

PR_append = "_psdkla_98"

require rtos-mem-map.inc
