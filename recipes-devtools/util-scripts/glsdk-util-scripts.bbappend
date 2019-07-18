SRCREV = "c808d0eae3de801a7b4a14fa8296c21565e7b500"
COMPATIBLE_MACHINE_append = "|j7-evm"
PR_append = "_psdkla"
RDEPENDS_${PN} += "bash"

do_install() {
    install -d ${D}${datadir}/ti/util-scripts
    install -d ${D}${datadir}/ti/util-scripts/demo
    install -m 755 ${S}/demo/* ${D}${datadir}/ti/util-scripts/demo/.
}

