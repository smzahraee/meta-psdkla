DESCRIPTION = "Package that will install a uEnv_edgeai-apps.txt file into the SDK prebuilt-binaries directory"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"

COMPATIBLE_MACHINE = "j7-evm|j7-hs-evm|j721s2-evm|j721s2-hs-evm|j784s4-evm|j784s4-hs-evm|am62axx-evm"

SRC_URI = "\
    file://uEnv_edgeai-apps.txt \
"

PR = "r1"
PV = "1.0"

PACKAGE_ARCH = "${MACHINE_ARCH}"

S = "${WORKDIR}"

do_install () {
    install -d ${D}/board-support/prebuilt-images

    install -m 0644 ${S}/uEnv_edgeai-apps.txt ${D}/board-support/prebuilt-images/
}

FILES_${PN} += "board-support/*"

# deploy files for wic image
inherit deploy
do_deploy() {
    install -d ${DEPLOYDIR}
    install -m 0644 ${S}/uEnv_edgeai-apps.txt ${DEPLOYDIR}
}
addtask deploy before do_build after do_unpack
