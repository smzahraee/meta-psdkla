SUMMARY = "EdgeAI GST plugins"
DESCRIPTION = "EdgeAI GST plugins implements custom elements to offload compute to HW accelerators and DSPs on TI devices"
HOMEPAGE = "https://github.com/TexasInstruments/edgeai-gst-plugins"

LICENSE = "TI-TFL"
LIC_FILES_CHKSUM = "file://LICENSE;md5=1f7721ee7d288457c5a70d0c8ff44b87"

SRC_URI = "git://github.com/TexasInstruments/edgeai-gst-plugins.git;protocol=https;branch=develop"
SRCREV = "d57d5817791d9fbb73d32f130801740b9eab0335"

PLAT_SOC = ""
PLAT_SOC_j7-evm = "j721e"
PLAT_SOC_j7-hs-evm = "j721e"
PLAT_SOC_j721s2-evm = "j721s2"
PLAT_SOC_j721s2-hs-evm = "j721s2"
PLAT_SOC_j784s4-evm = "j784s4"
PLAT_SOC_am62axx-evm = "am62a"

S = "${WORKDIR}/git"

DEPENDS = "edgeai-tiovx-modules gstreamer1.0-plugins-base"
RDEPENDS_${PN} = "edgeai-tiovx-modules"
RDEPENDS_${PN}-source = "bash edgeai-tiovx-modules-dev"

COMPATIBLE_MACHINE = "j7-evm|j7-hs-evm|j721s2-evm|j721s2-hs-evm|j784s4-evm|am62axx-evm"

export SOC = "${PLAT_SOC}"

PACKAGES += "${PN}-source"
FILES_${PN}-source += "/opt/"
FILES_${PN} += "${libdir}/gstreamer-1.0/*.so"

EXTRA_OEMESON = "--prefix=/usr -Dpkg_config_path=${S}/pkgconfig"

inherit meson

do_install_append() {
    CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"

    mkdir -p ${D}/opt/edgeai-gst-plugins
    cp ${CP_ARGS} ${S}/* ${D}/opt/edgeai-gst-plugins
}

INSANE_SKIP_${PN}-source += "dev-deps"

PR = "r0"
