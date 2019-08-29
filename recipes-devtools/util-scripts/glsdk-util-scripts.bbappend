SRCREV = "df50ca1592cae97ad0c7285686d602926b4f7305"
COMPATIBLE_MACHINE_append = "|j7-evm"
PR_append = "_psdkla"
RDEPENDS_${PN} += "bash"

do_install() {
    install -d ${D}${datadir}/ti/util-scripts
    install -d ${D}${datadir}/ti/util-scripts/demo
    install -m 755 ${S}/demo/* ${D}${datadir}/ti/util-scripts/demo/.
}

