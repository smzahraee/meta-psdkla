SUMMARY = "Statistics collector application"

LICENSE = "TI-TSPA"
LIC_FILES_CHKSUM = "file://LICENSE;md5=bb6bc27cd44417c389a180bd62f552a0"

PROTOCOL = "git"
BRANCH = "master"
SRCREV = "e7e40ece5e97c9811881278b867b109cfb1639d7"
SRC_URI = "git://git.ti.com/glsdk/statcol.git;protocol=${PROTOCOL};branch=${BRANCH}"

DEPENDS = "rpmsg-char-helper websocketd"

S = "${WORKDIR}/git"

EXTRA_OEMAKE += "SYSROOT=${STAGING_DIR_TARGET} "

do_install() {
	DESTDIR=${D} make install
}

PR_append = "_psdkla"
