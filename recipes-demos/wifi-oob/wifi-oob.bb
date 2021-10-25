DESCRIPTION = "WiFi out-of-box experience launcher"

LICENSE = "MIT"

LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

PR_append = "_psdkla_0"

PACKAGE_ARCH = "${MACHINE_ARCH}"

FILESEXTRAPATHS_prepend := "${THISDIR}/wifi-oob:"

FILES_${PN} += "${datadir}/intel9260/"

COMPATIBLE_MACHINE = "j7"
PACKAGE_ARCH = "${MACHINE_ARCH}"

SYSTEMD_SERVICE_${PN} = "startwlan.service"

inherit systemd

SRC_URI= " \
    file://ap_start.sh \
    file://ap_stop.sh \
    file://load_wlcore.sh \
    file://hostapd.conf \
    file://udhcpd.conf \
    file://01-wlan1-static.network \
    file://startwlan.sh \
    file://startwlan.service \
"

do_install() {
    install -d ${D}/${datadir}/intel9260/
    install -m 0755 ${WORKDIR}/ap_start.sh ${D}/${datadir}/intel9260
    install -m 0755 ${WORKDIR}/ap_stop.sh ${D}/${datadir}/intel9260
    install -m 0755 ${WORKDIR}/load_wlcore.sh ${D}/${datadir}/intel9260
    install -m 0755 ${WORKDIR}/udhcpd.conf ${D}/${datadir}/intel9260
    install -m 0755 ${WORKDIR}/hostapd.conf ${D}/${datadir}/intel9260

    install -d ${D}/${sysconfdir}/systemd/network
    install -m 0644 ${WORKDIR}/01-wlan1-static.network ${D}/${sysconfdir}/systemd/network

    install -d ${D}${sysconfdir}/systemd/system
    install -m 0644 ${WORKDIR}/startwlan.service ${D}${sysconfdir}/systemd/system

    install -d ${D}/${sysconfdir}/init.d
    install -m 0755 ${WORKDIR}/startwlan.sh ${D}/${sysconfdir}/init.d
}

