SUMMARY = "Out of box demo application"

LICENSE = "TI-TSPA"
LIC_FILES_CHKSUM = "file://j721e-evm-wallpaper.jpg;md5=77864a983bf55086f3ef64941aaf70e1"

FILESEXTRAPATHS_append := ":${THISDIR}/${PN}"

SRC_URI = " \
    file://j721e-evm-wallpaper.jpg \
    file://j7-evm-p0-wallpaper.jpg \
    file://j721e-sk-wallpaper.jpg \
    file://j721s2-evm-wallpaper.jpg \
    file://j721s2-sk-wallpaper.jpg \
    file://j784s4-evm-wallpaper.jpg \
    file://j784s4-sk-wallpaper.jpg \
    file://demo.service \
    file://weston-bg-update.service \
    file://weston-bg-update \
    file://autolaunch-demo \
    file://demo.sh \
"

DEPENDS += "weston-init"
RDEPENDS_${PN} += "weston-init bash"
SYSTEMD_SERVICE_${PN} = "demo.service weston-bg-update.service"

S = "${WORKDIR}"

inherit systemd

SOC="_soc_name_"
SOC_j7-evm = "j721e"
SOC_j721s2-evm = "j721s2"
SOC_j784s4-evm = "j784s4"

WALLPAPER_DEF = "${SOC}-evm-wallpaper.jpg"
WALLPAPER_SK = "${SOC}-sk-wallpaper.jpg"

do_install() {
	install -d ${D}/${datadir}/demo
	install -m 644 ${WORKDIR}/${WALLPAPER_DEF} ${D}${datadir}/demo/
	install -m 644 ${WORKDIR}/j7-evm-p0-wallpaper.jpg ${D}${datadir}/demo/
	install -m 644 ${WORKDIR}/${WALLPAPER_SK} ${D}${datadir}/demo/
	install -m 0755 ${WORKDIR}/demo.sh ${D}${datadir}/demo/

	# Install the systemd unit, initscript and demo script
	install -d ${D}${systemd_system_unitdir}
	install -m 0644 ${WORKDIR}/demo.service ${D}${systemd_system_unitdir}
	install -m 0644 ${WORKDIR}/weston-bg-update.service ${D}${systemd_system_unitdir}

	install -d ${D}${sysconfdir}/init.d
	install -m 0755 ${WORKDIR}/autolaunch-demo ${D}${sysconfdir}/init.d
	install -m 0755 ${WORKDIR}/weston-bg-update ${D}${sysconfdir}/init.d

	# Update the wallpapers based on the Machine
	sed -i -e "s/__WALLPAPER_DEF__/${WALLPAPER_DEF}/" ${D}${sysconfdir}/init.d/weston-bg-update
	sed -i -e "s/__WALLPAPER_SK__/${WALLPAPER_SK}/" ${D}${sysconfdir}/init.d/weston-bg-update
}

pkg_postinst_${PN} () {
	sed -i 's%panel-position=top%&\nbackground-image=${datadir}/demo/${WALLPAPER_DEF}%' $D/etc/weston.ini
}

pkg_postrm_${PN} () {
	sed -i 's%background-image=${datadir}/demo/${WALLPAPER_DEF}%%' /etc/weston.ini
}

FILES_${PN} += " \
	${datadir}/demo/* \
"

PR_append = "_psdkla_3"
