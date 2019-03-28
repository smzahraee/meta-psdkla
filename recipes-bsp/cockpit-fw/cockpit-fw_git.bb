SUMMARY = "R5 PSDK Cockpit Firmware Packaging recipe"

LICENSE = "TI-TFL"
LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=04ad0a015d4bb63c2b9e7b112debf3db"

PV = "1.0-git${SRCPV}"
PACKAGE_ARCH = "${MACHINE_ARCH}"

inherit deploy
inherit update-alternatives

PROTOCOL = "http"
BRANCH = "psdkla-cockpit"
SRCREV = "63b21bf5720b34122316b67db386458d8abc835a"

SRC_URI = "git://bitbucket.itg.ti.com/scm/psdkla/ti-linux-firmware.git;protocol=${PROTOCOL};branch=${BRANCH}"

S = "${WORKDIR}/git"

TI_COCKPIT_DIR = "${S}/ti-cockpit/"
TI_COCKPIT_FILENAME = "cockpit_app_tirtos_linux_mcu2_0.out"

# make sure that lib/firmware, and all its contents are part of the package
FILES_${PN} += "${base_libdir}/firmware"

do_install() {
  install -d ${D}${base_libdir}/firmware
  install -m 0755 ${TI_COCKPIT_DIR}/${TI_COCKPIT_FILENAME} ${D}${base_libdir}/firmware
}

TARGET_MAIN_R5FSS0_0 = "j7-main-r5f0_0-fw"
ALTERNATIVE_${PN} = "j7-main-r5f0_0-fw"
ALTERNATIVE_LINK_NAME[j7-main-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0}"
ALTERNATIVE_TARGET[j7-main-r5f0_0-fw] = "${base_libdir}/firmware/${TI_COCKPIT_FILENAME}"
ALTERNATIVE_PRIORITY = "11"

# copy the executables in the deploy directory
# after the build, they will be available under
# build/arago-tmp-external-linaro-toolchain/deploy/images/j7-evm/
do_deploy () {
  install ${TI_COCKPIT_DIR}/${TI_COCKPIT_FILENAME} ${DEPLOYDIR}/
}
addtask deploy after do_install before do_build

# This is used to prevent the build system to strip the executables
INHIBIT_PACKAGE_STRIP = "1"
# This is used to prevent the build system to split the debug info in a separate file
INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
# As it likely to be a different arch from the Yocto build, disable checking by adding "arch" to INSANE_SKIP
INSANE_SKIP_${PN} += "arch"

# we don't want to configure and build the source code
do_compile[noexec] = "1"
do_configure[noexec] = "1"
