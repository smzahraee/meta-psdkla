DESCRIPTION = "WiFi out-of-box experience launcher"

LICENSE = "MIT"

LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

PR_append = "_psdkla_1"

PACKAGE_ARCH = "${MACHINE_ARCH}"

FILESEXTRAPATHS_prepend := "${THISDIR}/wifi-oob:"

FILES_${PN} += "${datadir}/intel9260/"

COMPATIBLE_MACHINE = "j7"
PACKAGE_ARCH = "${MACHINE_ARCH}"

SYSTEMD_SERVICE_${PN} = "startwlanap.service startwlansta.service"

inherit systemd

SRC_URI= " \
    file://ap_start.sh \
    file://ap_stop.sh \
    file://load_wlcore.sh \
    file://hostapd.conf \
    file://udhcpd.conf \
    file://01-wlan1-static.network \
    file://startwlanap.sh \
    file://startwlanap.service \
    file://startwlansta.service \
    file://startwlansta.sh \
    file://sta_connect-ex.sh \
    file://sta_start.sh \
    file://sta_stop.sh \
    file://wificfg \
"

do_install() {
    install -d ${D}/${datadir}/intel9260/
    install -m 0755 ${WORKDIR}/ap_start.sh ${D}/${datadir}/intel9260
    install -m 0755 ${WORKDIR}/ap_stop.sh ${D}/${datadir}/intel9260
    install -m 0755 ${WORKDIR}/load_wlcore.sh ${D}/${datadir}/intel9260
    install -m 0755 ${WORKDIR}/udhcpd.conf ${D}/${datadir}/intel9260
    install -m 0755 ${WORKDIR}/hostapd.conf ${D}/${datadir}/intel9260
    install -m 0755 ${WORKDIR}/sta_connect-ex.sh ${D}/${datadir}/intel9260
    install -m 0755 ${WORKDIR}/sta_start.sh ${D}/${datadir}/intel9260
    install -m 0755 ${WORKDIR}/sta_stop.sh ${D}/${datadir}/intel9260
    install -m 0755 ${WORKDIR}/wificfg ${D}/${datadir}/intel9260

    install -d ${D}/${sysconfdir}/systemd/network
    install -m 0644 ${WORKDIR}/01-wlan1-static.network ${D}/${sysconfdir}/systemd/network

    install -d ${D}${sysconfdir}/systemd/system
    install -m 0644 ${WORKDIR}/startwlanap.service ${D}${sysconfdir}/systemd/system
    install -m 0644 ${WORKDIR}/startwlansta.service ${D}${sysconfdir}/systemd/system

    install -d ${D}/${sysconfdir}/init.d
    install -m 0755 ${WORKDIR}/startwlanap.sh ${D}/${sysconfdir}/init.d
    install -m 0755 ${WORKDIR}/startwlansta.sh ${D}/${sysconfdir}/init.d
}

