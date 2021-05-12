FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:${THISDIR}/${PN}/${MACHINE}:"

PR_append = "_psdkla_2"
PV_append = "+git${SRCPV}"

BRANCH = "ti-linuxptp-v0.3-am57xx-bc"
SRCREV = "8b45431cb3dbc2df22de9a37c30d487fe838978c"

S = "${WORKDIR}/git"

do_install_append () {
    install -p ${S}/phc2pwm ${D}/${bindir}
}
