FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:${THISDIR}/${PN}/${MACHINE}:"

PR_append = "_psdkla"
PV_append = "+git${SRCPV}"

BRANCH = "ti-linuxptp"
SRCREV = "a06698a12e828a0372955c2d9c8d6604d8326811"

SRC_URI = " \
    git://git.ti.com/processor-sdk/linuxptp.git;branch=${BRANCH} \
    file://build-Allow-CC-and-prefix-to-be-overriden.patch \
    file://no-incdefs-using-host-headers.patch \
    file://0001-Merge-commit-of-remote-tracking-branch-remotes-origi.patch \
    file://0001-ptp-Fix-PTP_PPS_OFFSET-id.patch \
    file://0002-phc2sys.c-clean-up-extts-before-enabling.patch \
    file://0003-util-add-SIGHUP-handling.patch \
    file://0004-phc2sys-fix-BC-sync-fault-when-port-in-uncalibrated-.patch \
    file://0005-phc2sys-switch-to-async-read-of-extts.patch \
    file://0006-phc2sys.c-clean-up-extts-sync-init.patch \
    file://0007-phc2sys-reduce-sync-delay-after-enabling-extts.patch \
    file://0008-phc2sys-Postpone-adding-of-servo-to-clock.patch \
    file://0009-phc2sys.c-always-kill-servo-when-switch-to-master-fo.patch \
    file://0010-phc2sys-ti-fix-extts-for-phc2sys.c-always-kill-servo.patch \
    file://0011-phc2sys-do-not-step-clock-if-offset-is-small.patch \
    file://0012-phc2sys-add-delay-before-settime-after-master-switch.patch \
    file://0013-pmc-fix-port-state-passive-slave-displaying.patch \
    file://0014-phc2sys-fix-runtime-overhead.patch \
    file://0015-port-hsr-fix-SYNC_RX_TIMER-in-UNCALIBRATED-state.patch \
"

S = "${WORKDIR}/git"

do_install_append () {
    install -p ${S}/phc2pwm ${D}/${bindir}
}
