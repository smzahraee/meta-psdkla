SUMMARY = "Out of box demo application"

LICENSE = "TI-TSPA"
LIC_FILES_CHKSUM = "file://j7-evm-oob-wallpaper.jpg;md5=77864a983bf55086f3ef64941aaf70e1"

FILESEXTRAPATHS_append := ":${THISDIR}/${PN}"

SRC_URI = " \
    file://j7-evm-oob-wallpaper.jpg \
    file://j7-evm-p0-wallpaper.jpg \
"

DEPENDS += "weston-conf"
RDEPENDS_${PN} += "weston-conf"

S = "${WORKDIR}"

do_install() {
	install -d ${D}/${datadir}/demo
	install -m 644 ${WORKDIR}/j7-evm-oob-wallpaper.jpg ${D}${datadir}/demo/
	install -m 644 ${WORKDIR}/j7-evm-p0-wallpaper.jpg ${D}${datadir}/demo/
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

PR_append = "_psdkla"
