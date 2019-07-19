Summary = "R5 PSDK Gateway demo application firmware"

LICENSE = "TI-TFL"
LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=04ad0a015d4bb63c2b9e7b112debf3db"

PV = "1.0-git${SRCPV}"
PACKAGE_ARCH = "${MACHINE_ARCH}"

inherit deploy
inherit update-alternatives

PROTOCOL = "git"
BRANCH = "master"
SRCREV = "2d37ef55f7990d96990b2fee4279b5b48baaef1b"

SRC_URI = "git://git.ti.com/glsdk/ti-eth-fw.git;protocol=${PROTOCOL};branch=${BRANCH}"

S = "${WORKDIR}/git"

GATEWAY_FW_DIR = "${S}/gatewayapp"
GATEWAY_FW_FILENAME = "gatewayapp_mcu2_0_release.xer5f"

# make sure that lib/firmware, and all its contents are part of the package
FILES_${PN} += "${base_libdir}/firmware"

do_install() {
  install -d ${D}${base_libdir}/firmware
  install -m 0755 ${GATEWAY_FW_DIR}/${GATEWAY_FW_FILENAME} ${D}${base_libdir}/firmware
}

TARGET_MAIN_R5FSS0_0 = "j7-main-r5f0_0-fw"
ALTERNATIVE_${PN} = "j7-main-r5f0_0-fw"
ALTERNATIVE_LINK_NAME[j7-main-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0}"
ALTERNATIVE_TARGET[j7-main-r5f0_0-fw] = "${base_libdir}/firmware/${GATEWAY_FW_FILENAME}"
ALTERNATIVE_PRIORITY = "16"

# This is used to prevent the build system to strip the executables
INHIBIT_PACKAGE_STRIP = "1"
# This is used to prevent the build system to split the debug info in a separate file
INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
# As it likely to be a different arch from the Yocto build, disable checking by adding "arch" to INSANE_SKIP
INSANE_SKIP_${PN} += "arch"

# we don't want to configure and build the source code
do_compile[noexec] = "1"
do_configure[noexec] = "1"

PR_append = "_psdkla"

