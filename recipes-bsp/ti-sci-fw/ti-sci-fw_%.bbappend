FILESEXTRAPATHS_append := ":${THISDIR}/${PN}"

SRCREV_imggen-psdkra = "d9a550b91ec95d06a80f2ccc6dd829815ba35d88"
SRCREV_FORMAT += "_imggen-psdkra"

SRC_URI_append_j7-evm = " \
	git://git.ti.com/k3-image-gen/k3-image-gen.git;protocol=git;branch=master;destsuffix=imggen-psdkra;name=imggen-psdkra \
	file://0001-turn-off-msmc-cache-for-psdkra-cache-size-0.patch \
"

SYSFW_PSDKRA_IMAGE = "sysfw-psdkra.itb"

do_patch_j7-evm() {
	cd ${WORKDIR}/imggen-psdkra/
	patch -p1 < ${WORKDIR}/0001-turn-off-msmc-cache-for-psdkra-cache-size-0.patch
}

do_compile_append_j7-evm() {
	cd ${WORKDIR}/imggen-psdkra/
	oe_runmake
}

do_install_append_j7-evm() {
	install -d ${D}/boot
	install -m 644 ${WORKDIR}/imggen-psdkra/${SYSFW_BINARY} ${D}/boot/${SYSFW_PSDKRA_IMAGE}
}

do_deploy_append_j7-evm() {
	install -d ${DEPLOYDIR}
	install -m 644 ${WORKDIR}/imggen-psdkra/${SYSFW_BINARY} ${DEPLOYDIR}/${SYSFW_PSDKRA_IMAGE}
}

PR_append = "_psdkla"
