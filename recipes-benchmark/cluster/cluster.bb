SUMMARY = "Cluster application recipe"

LICENSE = "BSD"
LIC_FILES_CHKSUM = "file://LICENSE;md5=a4a199b1c95f2029f8663c25bf308c59"

PROTOCOL = "http"
BRANCH = "master"
SRCREV = "11cf460954aff8d60c67a4d74c70775ed4306634"
SRC_URI = "git://bitbucket.itg.ti.com/scm/psdkla/cluster.git;protocol=${PROTOCOL};branch=${BRANCH}"

DEPENDS = "rpmsg-char-helper drm"

S = "${WORKDIR}/git"

inherit autotools pkgconfig

ASSET_SIZE = "640x240"
DISPLAY_SIZE = "1280x800"

EXTRA_OECONF += " \
	--with-asset-size=${ASSET_SIZE} \
	--with-display-size=${DISPLAY_SIZE} \
	--with-drm-device-name=/dev/dri/card2 \
	--disable-plane-split \
	--enable-rpmsg-can-emulation \
"

FILES_${PN} += " \
	${datadir}/assets-${ASSET_SIZE}/dials/*.raw \
	${datadir}/assets-${ASSET_SIZE}/needles/*.raw \
	${datadir}/assets-${ASSET_SIZE}/digits/*.raw \
"

PR_append = "_psdkla_1"
