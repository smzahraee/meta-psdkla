SUMMARY = "Out of box demo application"

LICENSE = "TI-TSPA"
LIC_FILES_CHKSUM = "file://j7-evm-oob-wallpaper.jpg;md5=77864a983bf55086f3ef64941aaf70e1"

FILESEXTRAPATHS_append := ":${THISDIR}/${PN}"

SRC_URI = " \
    file://j7-evm-oob-wallpaper.jpg \
    file://j7-evm-p0-wallpaper.jpg \
    file://demo.service \
    file://autolaunch-demo \
    file://demo.sh \
"

DEPENDS += "weston-init"
RDEPENDS_${PN} += "weston-init bash"
SYSTEMD_SERVICE_${PN} = "demo.service"

S = "${WORKDIR}"

inherit systemd

do_install() {
	install -d ${D}/${datadir}/demo
	install -m 644 ${WORKDIR}/j7-evm-oob-wallpaper.jpg ${D}${datadir}/demo/
	install -m 644 ${WORKDIR}/j7-evm-p0-wallpaper.jpg ${D}${datadir}/demo/
	install -m 0755 ${WORKDIR}/demo.sh ${D}${datadir}/demo/

	# Install the systemd unit, initscript and demo script
	install -d ${D}${systemd_system_unitdir}
	install -m 0644 ${WORKDIR}/demo.service ${D}${systemd_system_unitdir}

	install -d ${D}${sysconfdir}/init.d
	install -m 0755 ${WORKDIR}/autolaunch-demo ${D}${sysconfdir}/init.d
}

pkg_postinst_${PN} () {
	sed -i 's%panel-position=top%&\nbackground-image=/usr/share/demo/j7-evm-oob-wallpaper.jpg%' $D/etc/weston.ini
}

pkg_postrm_${PN} () {
	sed -i 's%background-image=/usr/share/demo/j7-evm-oob-wallpaper.jpg%%' /etc/weston.ini
	sed -i 's%background-image=/usr/share/demo/j7-evm-p0-wallpaper.jpg%%' /etc/weston.ini
}

FILES_${PN} += " \
	${datadir}/demo/* \
"

PR_append = "_psdkla_1"
