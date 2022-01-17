FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:${THISDIR}/${PN}/${MACHINE}:"

SRC_URI_append_am57xx-evm = " \
    file://0001-net-ethernet-ti-icss_iep-fix-access-to-x_REG1-in-non.patch \
    file://0002-net-ethernet-ti-icss_iep-disable-extts-and-pps-if-no.patch \
    file://0003-net-ethernet-ti-icss_iep-fix-pps-irq-race-vs-pps-dis.patch \
    file://0004-net-ethernet-ti-icss_iep-fix-icss_iep_gettime.patch \
    file://0005-net-ethernet-ti-icss_iep-simplify-peroutput-processi.patch \
    file://0006-net-ethernet-ti-icss_iep-use-readl-writel-in-cap_cmp.patch \
    file://0007-net-ethernet-ti-icss_iep-switch-to-.gettimex64.patch \
    file://0008-net-ethernet-ti-cpts-protect-critical-clock-get-time.patch \
    file://0009-net-ethernet-ti-icss_iep-Update-compare-registers-af.patch \
    file://0010-net-ethernet-ti-prueth-Update-the-firmware-offsets.patch \
    file://0011-HACK-ptp_clock-Add-new-PTP-Clock-Request-PPS-OFFSET.patch \
    file://0012-HACK-Documentation-dt-net-Add-TI-PTP-BC-bindings.patch \
    file://0013-HACK-net-ethernet-ti-introduce-ptp-boundary-clock-in.patch \
    file://0014-HACK-net-ethernet-ti-icss_iep-Add-BC-sync-support.patch \
    file://0015-HACK-net-ethernet-ti-cpts-add-1pps-support-using-dmt.patch \
    file://0016-HACK-arm-dts-am57xx-add-am57-1-2-4-x-idk-pps.dtso.patch \
    file://0017-ti_config_fragments-connectivity.cfg-enable-pps-bc-s.patch \
    file://0018-drivers-net-ethernet-ti-cpts.c-add-trace-for-cpts-ev.patch \
    file://0019-HACK-net-ethernet-ti-icss_iep-Use-delayed-work-for-c.patch \
    file://0020-net-ethernet-ti-prueth-Initialize-dram.patch \
    file://0021-net-ethernet-ti-prueth-Do-not-compensate-phy-values.patch \
    file://0022-HACK-net-ethernet-ti-cpts-fix-race-cpts_latch_proc-v.patch \
    file://0023-cpts-latch-clean-on-stop.patch \
    file://0024-cpts-latch-drop-dbg-from-cpts_1pps_latch_interrupt.patch \
    file://0025-cpts-latch-split-init-and-adjust.patch \
    file://0026-cpts-latch-disable-tmr-irq-while-latch-is-on.patch \
    file://0027-v2-net-ethernet-prueth-fix-packet-loss-by-using-thre.patch \
    file://0028-net-ethernet-ti-cpts-clean-timer-capture-status.patch \
    file://0029-net-ethernet-ti-icss_iep-fix-irq-enabling.patch \
    file://0030-irqchip-irq-pruss-intc-allow-shared-irq-mapping-betw.patch \
    file://0031-HACK-remoteproc-pru_rproc-add-intc-fixup.patch \
    file://0032-irqchip-irq-pruss-intc-fix-enabling-of-intc-events.patch \
    file://0033-HACK-irqchip-irq-pruss-intc-fix-processing-of-level-.patch \
    file://0034-net-ethernet-prueth-convert-hsr-prp-irq-to-threaded-.patch \
    file://0035-net-ethernet-ti-prueth-fix-rx-timestamp-reading-when.patch \
    file://0036-HACK-v2-net-packet-Avoid-fragmented-SKB.patch \
    file://0037-net-hsr-hsr_forward-fix-tx_flags-copy.patch \
    file://0038-Queue-to-PCP-map-fix.patch \
    file://0039-Added-TX_IPG-configuration-to-prueth-driver.patch \
"

KERNEL_DEVICETREE_append_am57xx-evm = " \
        am571x-idk-pps.dtb \
        am572x-idk-pps.dtb \
        am574x-idk-pps.dtb \
"

PR_append = "_psdkla_9"
