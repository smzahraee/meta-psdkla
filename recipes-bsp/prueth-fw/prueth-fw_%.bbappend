FILESEXTRAPATHS_prepend := "${THISDIR}/${MACHINE}:"

SRC_URI_append_am57xx-evm = " \
    file://am57xx-pru0-prueth-fw.elf \
    file://am57xx-pru1-prueth-fw.elf \
"

do_install() {
        install -d ${D}${base_libdir}/firmware/ti-pruss
        for f in ${TARGET}; do
                install -m 0644 ${WORKDIR}/$f ${D}${base_libdir}/firmware/ti-pruss/$f
        done
}

PR_append = "_psdkla_2"
