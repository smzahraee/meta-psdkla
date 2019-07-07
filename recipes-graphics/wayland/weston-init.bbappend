FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
    file://runWeston-patch \
"

do_patch() {
	cd ${WORKDIR}
	patch -p1 < ${WORKDIR}/runWeston-patch
}

PR_append = "_psdkla"
