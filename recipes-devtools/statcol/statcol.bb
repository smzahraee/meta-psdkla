SUMMARY = "Statistics collector application"

LICENSE = "TI-TSPA"
LIC_FILES_CHKSUM = "file://LICENSE;md5=bb6bc27cd44417c389a180bd62f552a0"

PROTOCOL = "git"
BRANCH = "master"
SRCREV = "80bac9aa2d20160197b336ab3c82ce9080091978"
SRC_URI = "git://git.ti.com/glsdk/statcol.git;protocol=${PROTOCOL};branch=${BRANCH}"

DEPENDS = "rpmsg-char-helper websocketd"

S = "${WORKDIR}/git"

EXTRA_OEMAKE += "SYSROOT=${STAGING_DIR_TARGET} CROSS_COMPILE=${CROSS_COMPILE}"

do_install() {
	DESTDIR=${D} make install
}

PR_append = "_psdkla"
