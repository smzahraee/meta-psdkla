FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:${THISDIR}/${PN}/${MACHINE}:"

SRC_URI_append_j7-evm = " \
    file://0001-arm64-dts-ti-add-new-DT-overlays-for-PSDKRA.patch \
    file://0002-ti_config_fragments-v8_baseport-Enable-CONFIG_UIO.patch \
    file://0003-arm64-dts-ti-remote-VP0-clocks-from-ownership.patch \
    file://0004-rpmsg-char-enhancements.patch \
    file://0005-ti_config_fragments-v8_ipc-enable-rpmsg_char.patch \
    file://0006-drm-panel-simple-Add-timing-for-dummy-display.patch \
    file://0008-ntb-Add-ntb_peer-driver.patch \
    file://0009-ti_config_fragments-v8_baseport-enable-ntb_peer.patch \
    file://0010-arm64-dts-ti-Use-a-bigger-region-for-PCIe-outbound-a.patch \
    file://0011-arm64-dts-ti-Increase-memory-window-size-for-NTB.patch \
    file://0012-HACK-arm64-dts-ti-Disable-SMMU-for-PCIe.patch \
    file://0013-ntb-ntb_hw_epf-Support-64-bit-address-in-ntb_hw_epf.patch \
"

KERNEL_DEVICETREE_append = " \
	ti/k3-j721e-vision-apps.dtbo \
"

PR_append = "_psdkla"
