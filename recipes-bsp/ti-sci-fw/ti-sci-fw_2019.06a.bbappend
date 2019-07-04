FILESEXTRAPATHS_append := ":${THISDIR}/${PN}"

SRC_URI_append = " \
	file://0001-enable-debug-trace.patch \
"

do_patch() {
	cd ${WORKDIR}/imggen/
	patch -p1 < ${WORKDIR}/0001-enable-debug-trace.patch
}

PR_append = "_psdkla"
