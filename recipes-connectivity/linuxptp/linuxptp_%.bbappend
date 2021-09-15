FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:${THISDIR}/${PN}/${MACHINE}:"

PR_append = "_psdkla_4"
PV_append = "+git${SRCPV}"

BRANCH = "ti-linuxptp-v0.3-am57xx-bc"
SRCREV = "82a78889f84830aaafdece92432b26203aec21d4"

S = "${WORKDIR}/git"

do_install_append () {
    install -p ${S}/phc2pwm ${D}/${bindir}
}
