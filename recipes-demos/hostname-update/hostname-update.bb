SUMMARY = "Updating hostname for J7-SK as tda4vm-sk"

LICENSE = "MIT"

LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"


FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI= " \
    file://hostname-update \
    file://hostname-update.service \
"

RDEPENDS_${PN} += "bash"

SYSTEMD_SERVICE_${PN} = "hostname-update.service"

inherit systemd

do_install() {
    install -d ${D}${sysconfdir}/systemd/system
    install -m 0644 ${WORKDIR}/hostname-update.service ${D}${sysconfdir}/systemd/system

    install -d ${D}/${sysconfdir}/init.d
    install -m 0755 ${WORKDIR}/hostname-update ${D}/${sysconfdir}/init.d
}

PR_append = "_psdkla_0"
