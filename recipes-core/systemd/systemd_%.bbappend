FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append_j7-evm = " \
	file://hostname-update.service \
	file://hostname-update \
"

do_install_append_j7-evm() {
	install -m 0644 ${WORKDIR}/hostname-update.service ${D}${sysconfdir}/systemd/system/
	install -m 0755 ${WORKDIR}/hostname_update ${D}${sysconfdir}/init.d
}

PR_append = "_psdkla_1"
