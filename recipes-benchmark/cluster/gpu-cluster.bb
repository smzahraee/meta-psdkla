SUMMARY = "GPU Cluster application"

LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"

PROTOCOL = "git"
BRANCH = "gpu-cluster"
SRCREV = "f2cbcb8ae295f9fe6d202b9caf234455731a1be7"
SRC_URI = " \
	git://git.ti.com/glsdk/ti-cluster-linux-application.git;protocol=${PROTOCOL};branch=${BRANCH} \
"

DEPENDS = "rpmsg-char-helper drm virtual/egl virtual/libgles2 libpng"

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
	${datadir}/gpu-cluster-assets/*.png \
"

PR_append = "_psdkla"
