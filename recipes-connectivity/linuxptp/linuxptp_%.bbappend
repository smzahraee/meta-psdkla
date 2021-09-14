FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:${THISDIR}/${PN}/${MACHINE}:"

PR_append = "_psdkla_3"
PV_append = "+git${SRCPV}"

BRANCH = "ti-linuxptp-v0.3-am57xx-bc"
SRCREV = "8b45431cb3dbc2df22de9a37c30d487fe838978c"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

S = "${WORKDIR}/git"

SRC_URI_append_am57xx-evm = " \
    file://0001-phc2sys-fix-hogging-one-cpu-core-after-port-state-sw.patch \
   "

do_install_append () {
    install -p ${S}/phc2pwm ${D}/${bindir}
}
