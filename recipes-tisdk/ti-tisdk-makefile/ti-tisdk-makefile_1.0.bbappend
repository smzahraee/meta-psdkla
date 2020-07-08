FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:${THISDIR}/${PN}/${MACHINE}:"

SRC_URI_remove_j7-evm = "\
    file://Makefile_matrix-gui \
    file://Makefile_matrix-gui-browser \
"
SRC_URI_append = "\
    file://Makefile_oob-demo \
"

MAKEFILES_COMMON_remove_j7-evm = "\
    matrix-gui \
    matrix-gui-browser \
"
MAKEFILES_remove_j7-evm = " \
    pru-icss \
"
MAKEFILES_append_j7-evm = " oob-demo \
"
do_install_append_k3() {
    cat >> ${D}/Rules.make << __EOF__

# Add CROSS_COMPILE and UBOOT_MACHINE for the R5
export CROSS_COMPILE_ARMV7=\$(LINUX_DEVKIT_PATH)/sysroots/${SDKMACHINE}-arago-linux/usr/bin/arm-none-linux-gnueabihf-
UBOOT_MACHINE_R5=${K3_UBOOT_MACHINE_R5}
__EOF__
}


PR_append = "_psdkla"
