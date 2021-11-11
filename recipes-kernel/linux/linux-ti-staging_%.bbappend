FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://0001-HACK-ptp_clock-Add-new-PTP-Clock-Request-PPS-OFFSET.patch \
file://0002-HACK-Documentation-dt-net-Add-TI-PTP-BC-bindings.patch \
file://0003-HACK-net-ethernet-ti-introduce-ptp-boundary-clock-in.patch \
file://0004-HACK-net-ethernet-ti-icss_iep-Add-BC-sync-support.patch \
file://0005-HACK-net-ethernet-ti-cpts-add-1pps-support-using.patch \
file://0006-HACK-arm-dts-am57xx-add-am57-1-2-4-x-idk-pps.dtso.patch \
file://0007-ti_config_fragments-connectivity.cfg-enable-pps-bc.patch \
file://0008-drivers-net-ethernet-ti-cpts.c-add-trace-for-cpts.patch \
file://0009-HACK-net-ethernet-ti-icss_iep-Use-delayed-work-for.patch \
file://0010-HACK-net-ethernet-ti-cpts-fix-race-cpts_latch_proc.patch \
file://0011-cpts-latch-clean-on-stop.patch \
file://0012-cpts-latch-split-init-and-adjust.patch \
file://0013-net-ethernet-ti-icss_iep-fix-irq-enabling.patch \
file://0014-HACK-patches-fix.patch"

KERNEL_DEVICETREE_append_am57xx-evm = " \
        ti/am571x-idk-pps.dtbo \
        ti/am572x-idk-pps.dtbo \
        ti/am574x-idk-pps.dtbo \
"

PR_append = "_psdkla_5"
