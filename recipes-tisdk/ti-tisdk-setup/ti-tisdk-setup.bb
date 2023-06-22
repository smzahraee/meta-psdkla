
DESCRIPTION = "Package containing scripts to setup the development host and target board"
LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://setup.sh;beginline=3;endline=31;md5=fc4b04a33df6d892c9f4d4a9d92b945e"

FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

PR = "r49"

BRANCH ?= "master"
SRCREV = "582acfb44fdfcb6d8f1504d23edd8afab7d56257"
SRC_URI = "\
          git://git.ti.com/git/processor-sdk/tisdk-setup-scripts.git;protocol=https;branch=${BRANCH} \
          file://0001-TFTP-Fixing-tftp-setup-script.patch \
          "

S = "${WORKDIR}/git"

PACKAGE_ARCH = "${MACHINE_ARCH}"

SDCARD_SCRIPT = " create-sdcard.sh"

SETUP_SCRIPTS = " common.sh \
                  setup-host-check.sh \
                  setup-minicom.sh \
                  setup-package-install.sh \
                  setup-targetfs-nfs.sh \
                  setup-tftp.sh \
                  add-to-group.sh \
                  create-ubifs.sh \
                  ${SDCARD_SCRIPT} \
"

UBOOT_ENV:omapl138 = "setup-uboot-env-am18x.sh"
UBOOT_ENV:ti33x = "setup-uboot-env-am335x.sh"
UBOOT_ENV:ti43x = "setup-uboot-env-am43x.sh"
UBOOT_ENV:omap5-evm = "setup-uboot-env-omap5.sh"
UBOOT_ENV:am57xx-evm = "setup-uboot-env-am57xx-evm.sh"
UBOOT_ENV:k3 = "setup-uboot-env-am65x.sh"
UBOOT_ENV = "setup-uboot-unknown.sh"

do_install () {
    install -m 0755 ${S}/setup.sh ${D}/

    install -d ${D}/bin
    for script in ${SETUP_SCRIPTS}
    do
        install -m 0755 ${S}/${script} ${D}/bin
    done

    install -m 0755 ${S}/${UBOOT_ENV} ${D}/bin/setup-uboot-env.sh

    if [ -z "${MKUBIFS_ARGS}" -o -z "${UBINIZE_ARGS}" ]
    then
        # UBIFS not supported
        rm "${D}/bin/create-ubifs.sh"
    else
        sed -i -e "s|__MKUBIFS_ARGS__|${MKUBIFS_ARGS}|" \
               -e "s|__UBINIZE_ARGS__|${UBINIZE_ARGS}|" \
                  "${D}/bin/create-ubifs.sh"
    fi
}

FILES:${PN} += "setup.sh"
RDEPENDS:${PN} += "bash"
