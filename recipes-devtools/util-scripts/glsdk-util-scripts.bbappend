SRCREV = "5a3f8eca444a5c4bf8855705a3018d482e3e19cd"
COMPATIBLE_MACHINE_append = "|j7-evm"
PR_append = "_psdkla"
RDEPENDS_${PN} += "bash"

do_install() {
    install -d ${D}${datadir}/ti/util-scripts
    install -d ${D}${datadir}/ti/util-scripts/demo
    install -m 755 ${S}/demo/* ${D}${datadir}/ti/util-scripts/demo/.
}

