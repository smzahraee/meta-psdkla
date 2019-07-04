SUMMARY = "Cluster application recipe"

LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"

PROTOCOL = "git"
BRANCH = "master"
SRCREV = "0865db06e56553ba8a2c32fd3b0cc8182bf6e5aa"
SRC_URI = " \
	git://git.ti.com/glsdk/ti-cluster-linux-application.git;protocol=${PROTOCOL};branch=${BRANCH} \
"

DEPENDS = "rpmsg-char-helper drm"

S = "${WORKDIR}/git"

inherit autotools pkgconfig

ASSET_SIZE = "1920x720"
DISPLAY_SIZE = "1920x1080"

EXTRA_OECONF += " \
	--with-asset-size=${ASSET_SIZE} \
	--with-display-size=${DISPLAY_SIZE} \
	--with-drm-device-name=/dev/dri/card1 \
	--disable-plane-split \
	--enable-rpmsg-can-emulation \
"

FILES_${PN} += " \
	${datadir}/assets-${ASSET_SIZE}/dials/*.raw \
	${datadir}/assets-${ASSET_SIZE}/needles/*.raw \
	${datadir}/assets-${ASSET_SIZE}/digits/*.raw \
"

PR_append = "_psdkla"
