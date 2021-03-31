FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:${THISDIR}/${PN}/${MACHINE}:"

SRC_URI_remove_j7-evm = "\
    file://Makefile_matrix-gui \
    file://Makefile_matrix-gui-browser \
    file://Makefile_ti-ipc \
    file://Makefile_u-boot-spl \
"

SRC_URI_append = "\
    file://Makefile_oob-demo \
    file://Makefile_u-boot-spl-j7 \
    file://Makefile_u-boot-spl-j7200 \
    file://Makefile_ti-img-encode-decode \
"

MAKEFILES_COMMON_remove_j7-evm = "\
    matrix-gui \
    matrix-gui-browser \
"

MAKEFILES_remove_j7-evm = " \
    pru-icss \
    ti-ipc \
    u-boot-spl \
"

SRC_URI_remove_j7200-evm = "\
    file://Makefile_matrix-gui \
    file://Makefile_matrix-gui-browser \
    file://Makefile_ti-ipc \
    file://Makefile_ti-img-rogue-driver \
    file://Makefile_u-boot-spl \
    file://Makefile_sysfw-image \
"

MAKEFILES_COMMON_remove_j7200-evm = "\
    matrix-gui \
    matrix-gui-browser \
"

MAKEFILES_remove_j7200-evm = " \
    pru-icss \
    ti-ipc \
    ti-img-rogue-driver \
    u-boot-spl \
    sysfw-image \
"

MAKEFILES_append_j7-evm = " oob-demo \
    u-boot-spl-j7 \
    ti-img-encode-decode \
"

MAKEFILES_append_j7200-evm = " u-boot-spl-j7200 \
"

SRC_URI_append_am65xx-evm = "\
    file://Makefile_ti-sgx-ddk-km-am65xx \
"

SRC_URI_remove_am65xx-evm = "\
    file://Makefile_matrix-gui \
    file://Makefile_matrix-gui-browser \
    file://Makefile_refresh-screen \
    file://Makefile_qt-tstat \
    file://Makefile_pru \
    file://Makefile_barcode-roi \
    file://Makefile_mmwavegesture-hmi \
    file://Makefile_pdm-anomaly-detection \
    file://Makefile_ti-ipc \
    file://Makefile_ti-sgx-ddk-km \
"
MAKEFILES_append_am65xx-evm = " ti-sgx-ddk-km-am65xx \
"

MAKEFILES_COMMON_remove_am65xx-evm = "\
    matrix-gui \
    matrix-gui-browser \
    refresh-screen \
    qt-tstat \
"
MAKEFILES_remove_am65xx-evm = " \
    pru-icss \
    barcode-roi \
    mmwavegesture-hmi \
    pdm-anomaly-detection \
    ti-ipc \
    ti-sgx-ddk-km \
"

K3_UBOOT_MACHINE_R5_j7200-evm = "j7200_evm_r5_config"

do_install_append_k3() {
    cat >> ${D}/Rules.make << __EOF__

# Add CROSS_COMPILE and UBOOT_MACHINE for the R5
export CROSS_COMPILE_ARMV7=\$(LINUX_DEVKIT_PATH)/sysroots/${SDKMACHINE}-arago-linux/usr/bin/arm-none-linux-gnueabihf-
UBOOT_MACHINE_R5=${K3_UBOOT_MACHINE_R5}
__EOF__
}

PR_append = "_psdkla_1"
