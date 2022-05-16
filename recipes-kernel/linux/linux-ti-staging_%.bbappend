FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:${THISDIR}/${PN}/${MACHINE}:"

SRC_URI += "file://0001-net-ethernet-ti-cpts-protect-critical-clock-get-time.patch \
file://0002-HACK-ptp_clock-Add-new-PTP-Clock-Request-PPS-OFFSET.patch \
file://0003-HACK-Documentation-dt-net-Add-TI-PTP-BC-bindings.patch \
file://0004-HACK-net-ethernet-ti-introduce-ptp-boundary-clock-in.patch \
file://0005-HACK-net-ethernet-ti-icss_iep-Add-BC-sync-support.patch \
file://0006-HACK-net-ethernet-ti-cpts-add-1pps-support-using-dmt.patch \
file://0007-HACK-arm-dts-am57xx-add-am57-1-2-4-x-idk-pps.dts.patch \
file://0008-ti_config_fragments-connectivity.cfg-enable-pps-bc-s.patch \
file://0009-drivers-net-ethernet-ti-cpts.c-add-trace-for-cpts-ev.patch \
file://0010-HACK-net-ethernet-ti-icss_iep-Use-delayed-work-for-c.patch \
file://0011-HACK-net-ethernet-ti-cpts-fix-race-cpts_latch_proc-v.patch \
file://0012-cpts-latch-clean-on-stop.patch \
file://0013-cpts-latch-drop-dbg-from-cpts_1pps_latch_interrupt.patch \
file://0014-cpts-latch-split-init-and-adjust.patch \
file://0015-cpts-latch-disable-tmr-irq-while-latch-is-on.patch \
file://0016-net-ethernet-ti-cpts-clean-timer-capture-status.patch \
file://0017-HACK-v2-net-packet-Avoid-fragmented-SKB.patch \
file://0018-ti_config_fragments-dra7_only-Enable-CLS_FLOWER.patch \
file://0019-clocksource-drivers-timer-ti-dm-move-errata-i940-fix.patch "

PATCHTOOL = "git"

KERNEL_DEVICETREE_append_am57xx-evm = " \
        am571x-idk-pps.dtb \
        am572x-idk-pps.dtb \
        am574x-idk-pps.dtb \
"

KERNEL_DEVICETREE_append_am57xx-hs-evm = " \
        am571x-idk-pps.dtb \
        am572x-idk-pps.dtb \
        am574x-idk-pps.dtb \
"

PR_append = "_psdkla_10"
