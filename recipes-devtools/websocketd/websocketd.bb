SUMMARY = "Application for routing native applications via websockets"
HOMEPAGE = "http://websocketd.com/"

LICENSE = "BSD-2-Clause"
LIC_FILES_CHKSUM = "file://LICENSE;md5=a14d7befdbee1290ac5c472cd85d66f2"

PV = "0.3.0"
SRC_URI = "https://github.com/joewalnes/websocketd/releases/download/v${PV}/websocketd-${PV}-linux_arm64.zip"
SRC_URI[md5sum] = "968c1ce4ed4fe5f86817f2533f5d3004"

S = "${WORKDIR}"

do_install() {
	install -d ${D}/${bindir}
	install -m 0755 ${S}/websocketd ${D}${bindir}/
}

PR_append = "_psdkla"
