FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " file://custom_limits.conf"

do_install_append_j7-evm(){
    install -m 0644 ${WORKDIR}/custom_limits.conf ${D}${sysconfdir}/security/limits.conf
}

PR_append = "_psdkla0"
