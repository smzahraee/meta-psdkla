SUMMARY = "Texas Instruments Inter-VM heartbeat application recipe"

LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"

PROTOCOL = "git"
BRANCH = "master"
SRCREV = "cc33efa70381bef4fadc1d027096f6cb047e2325"
SRC_URI = "git://git.ti.com/glsdk/ti-ivshmem-heartbeart-apps.git;protocol=${PROTOCOL};branch=${BRANCH}"

DEPENDS = "rpmsg-char-helper"

RDEPENDS_${PN} = "rpmsg-char-helper ivshmem-uio-driver"

S = "${WORKDIR}/git"

inherit autotools pkgconfig

EXTRA_OECONF += " \
	--disable-heartbeat-provider \
	--enable-remote-message \
"

PR_append = "_psdkla"
