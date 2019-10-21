FILESEXTRAPATHS_append := ":${THISDIR}/${PN}"

SRCREV_imggen-psdkra = "38a82e00f84efdf381dba001fff75e8411898e99"
SRCREV_FORMAT += "_imggen-psdkra"

SRC_URI_append = " \
	git://git.ti.com/processor-firmware/system-firmware-image-gen.git;protocol=git;branch=master;destsuffix=imggen-psdkra;name=imggen-psdkra \
	file://0001-turn-off-msmc-cache-for-psdkra-cache-size-0.patch \
"

SYSFW_PSDKRA_IMAGE = "sysfw-psdkra.itb"

do_patch() {
	cd ${WORKDIR}/imggen-psdkra/
	patch -p1 < ${WORKDIR}/0001-turn-off-msmc-cache-for-psdkra-cache-size-0.patch
}

do_compile_append() {
	cd ${WORKDIR}/imggen-psdkra/
	oe_runmake
}

do_install_append() {
	install -d ${D}/boot
	install -m 644 ${WORKDIR}/imggen-psdkra/${SYSFW_BINARY} ${D}/boot/${SYSFW_PSDKRA_IMAGE}
}

do_deploy_append () {
	install -d ${DEPLOYDIR}
	install -m 644 ${WORKDIR}/imggen-psdkra/${SYSFW_BINARY} ${DEPLOYDIR}/${SYSFW_PSDKRA_IMAGE}
}

PR_append = "_psdkla"
