SUMMARY = "Updating hostname based on device being used"

LICENSE = "MIT"

LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"


FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI= " \
    file://hostname-update \
    file://hostname-update.service \
"

RDEPENDS:${PN} += "bash"

SYSTEMD_SERVICE:${PN} = "hostname-update.service"

inherit systemd

HOSTNAME_UPDATE = "${MACHINE}"
HOSTNAME_UPDATE:j721e = "tda4vm-sk"
HOSTNAME_UPDATE:j721s2 = "am68a-sk"
HOSTNAME_UPDATE:j784s4 = "am69a-sk"

do_install() {
    install -d ${D}${sysconfdir}/systemd/system
    install -m 0644 ${WORKDIR}/hostname-update.service ${D}${sysconfdir}/systemd/system

    install -d ${D}/${sysconfdir}/init.d
    install -m 0755 ${WORKDIR}/hostname-update ${D}/${sysconfdir}/init.d

    sed -i -e "s/__MACHINE__/${MACHINE}/" ${D}/${sysconfdir}/init.d/hostname-update
    sed -i -e "s/__UPDATE__/${HOSTNAME_UPDATE}/" ${D}/${sysconfdir}/init.d/hostname-update
}

PR:append = "_psdkla_4"
