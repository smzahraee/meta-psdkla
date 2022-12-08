SUMMARY = "EdgeAI DL Inferer"
DESCRIPTION = "A Linux based CPP library for abstracting Open Source Runtime (OSRT) API"
HOMEPAGE = "https://git.ti.com/cgit/edgeai/edgeai-dl-inferer/about/"

LICENSE = "TI-TFL"
LIC_FILES_CHKSUM = "file://LICENSE;md5=4309553a9d3611cdf7a78bd169ec583c"

SRC_URI = "git://git.ti.com/edgeai/edgeai-dl-inferer.git;protocol=git;branch=develop"
SRCREV = "503e98c3843c72e23ec1f3d74732ceee266c654e"

S = "${WORKDIR}/git"

DEPENDS = "ti-tidl-osrt yaml-cpp dlpack-headers opencv"
RDEPENDS_${PN} += "ti-tidl-osrt-staticdev dlpack-headers"
RDEPENDS_${PN}-source = "bash python3-core"

COMPATIBLE_MACHINE = "j7-evm|j7-hs-evm|j721s2-evm|j721s2-hs-evm|j784s4-evm|am62axx-evm"

EXTRA_OECMAKE = "-DTARGET_FS=${WORKDIR}/recipe-sysroot -DCMAKE_SKIP_RPATH=TRUE"

FILES_${PN} += "/usr/lib/python3.8/site-packages/"
PACKAGES += "${PN}-source"
FILES_${PN}-source += "/opt/"

inherit cmake

do_install_append() {
    CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"

    mkdir -p ${D}/opt/edgeai-dl-inferer
    cp ${CP_ARGS} ${S}/* ${D}/opt/edgeai-dl-inferer
    rm -rf ${D}/opt/edgeai-dl-inferer/lib
    rm -rf ${D}/usr/cmake
}

INSANE_SKIP_${PN} += "dev-deps"

PR = "r0"
