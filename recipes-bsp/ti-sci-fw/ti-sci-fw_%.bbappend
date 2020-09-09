FILESEXTRAPATHS_append := ":${THISDIR}/${PN}"

SRCREV_imggen-psdkra = "5b4d37b9bf41d58ff8c2f8dc98e5dac25e69ec56"
SRCREV_FORMAT += "_imggen-psdkra"

SRC_URI_append_j7-evm-k3r5 = " \
	git://git.ti.com/k3-image-gen/k3-image-gen.git;protocol=git;branch=master;destsuffix=imggen-psdkra;name=imggen-psdkra \
	file://0001-VHWA-Created-new-entries-for-Main-R5F-2_1.patch \
"

SYSFW_PSDKRA_IMAGE = "sysfw-psdkra.itb"

do_patch() {
}

do_patch_j7-evm-k3r5() {
	cd ${WORKDIR}/imggen-psdkra/
	patch -p1 < ${WORKDIR}/0001-VHWA-Created-new-entries-for-Main-R5F-2_1.patch
}

do_compile_append_j7-evm-k3r5() {
	cd ${WORKDIR}/imggen-psdkra/
	oe_runmake
}

do_install_append_j7-evm-k3r5() {
	install -d ${D}/boot
	install -m 644 ${WORKDIR}/imggen-psdkra/${SYSFW_BINARY} ${D}/boot/${SYSFW_PSDKRA_IMAGE}
}

do_deploy_append_j7-evm-k3r5() {
	install -d ${DEPLOYDIR}
	install -m 644 ${WORKDIR}/imggen-psdkra/${SYSFW_BINARY} ${DEPLOYDIR}/${SYSFW_PSDKRA_IMAGE}
}

PR_append = "_psdkla"
