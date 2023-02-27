FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:${THISDIR}/${PN}/${MACHINE}:"

SRC_URI_append_j7 = "\
    file://Makefile_u-boot-spl-jacinto \
    file://Makefile_sysfw-image-jacinto \
    file://Makefile_linux-jacinto \
    file://Makefile_linux-dtbs-jacinto \
"

SRC_URI_remove_j7 = "\
    file://Makefile_ti-ipc \
    file://Makefile_pru-icss \
    file://Makefile_u-boot-spl \
    file://Makefile_sysfw-image \
    file://Makefile_linux \
    file://Makefile_linux-dtbs \
"

MAKEFILES_remove_j7 = " \
    ti-ipc \
    pru-icss \
    u-boot-spl \
    sysfw-image \
    linux-dtbs \
"

MAKEFILES_COMMON_remove_j7 = " \
    linux \
    matrix-gui \
"

MAKEFILES_append_j7 = " \
    u-boot-spl-jacinto \
    sysfw-image-jacinto \
    linux-jacinto \
    linux-dtbs-jacinto \
"

MAKEFILES_remove_j7200-evm = " \
    ti-img-rogue-driver \
"
MAKEFILES_remove_j7200-hs-evm = " \
    ti-img-rogue-driver \
"

MAKEFILES_remove_j721s2-evm = " \
    ti-img-rogue-driver \
"
MAKEFILES_remove_j721s2-hs-evm = " \
    ti-img-rogue-driver \
"

MAKEFILES_remove_j784s4-evm = " \
    ti-img-rogue-driver \
"
MAKEFILES_remove_j784s4-hs-evm = " \
    ti-img-rogue-driver \
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
    file://Makefile_pru-icss \
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
    pru \
    pru-icss \
    barcode-roi \
    mmwavegesture-hmi \
    pdm-anomaly-detection \
    ti-ipc \
    ti-sgx-ddk-km \
"

SOC = "unknown"
SOC_j7-evm = "j721e"
SOC_j7200-evm = "j7200"
SOC_j721s2-evm = "j721s2"
SOC_j784s4-evm = "j784s4"
SOC_am65xx-evm = "am65x"
SOC_j7-hs-evm = "j721e"
SOC_j7200-hs-evm = "j7200"
SOC_j721s2-hs-evm = "j721s2"
SOC_j784s4-hs-evm = "j784s4"
SOC_am65xx-hs-evm = "am65x"

SOC_TYPE = "gp"
SOC_TYPE_j7-hs-evm = "hs"
SOC_TYPE_j7200-hs-evm = "hs"
SOC_TYPE_j721s2-hs-evm = "hs"
SOC_TYPE_j784s4-hs-evm = "hs"
SOC_TYPE_am65xx-hs-evm = "hs"

SYSFW_SOC_HS = "${SOC}"
SYSFW_SOC_HS_j7-evm = "${SOC}_sr1_1"
SYSFW_SOC_HS_j7-hs-evm = "${SOC}_sr1_1"
SYSFW_SOC_HS_j7200-evm = "${SOC}_sr2"
SYSFW_SOC_HS_j7200-hs-evm = "${SOC}_sr2"

K3_UBOOT_MACHINE_R5_j7200-hs-evm = "j7200_hs_evm_r5_config"
K3_UBOOT_MACHINE_R5_j721s2-hs-evm = "j721s2_hs_evm_r5_config"

do_install_append_j7() {
    cat ${D}/Makefile | grep "__DTB_DEPEND_STAGE__" > /dev/null
    if [ "$?" == "0" ]
    then
        sed -i -e "s/__DTB_DEPEND_STAGE__/linux-dtbs_stage/" ${D}/Makefile
    else
        sed -i -e "s/__DTB_DEPEND_STAGE__//" ${D}/Makefile
    fi

    sed -i -e "s/^PLATFORM=.*/SOC = ${SOC}\nSOC_TYPE ?= ${SOC_TYPE}/g" ${D}/Rules.make

    cat >> ${D}/Rules.make << __EOF__

# Root of the boot partition to install boot binaries
BOOTFS ?= __BOOTFS__
__EOF__
}

do_install_append_j7-evm() {
    cat >> ${D}/Rules.make << __EOF__

export TI_SECURE_DEV_PKG=\$(TI_SDK_PATH)/board-support/core-secdev-k3

ifneq (\$(SOC_TYPE),gp)
	UBOOT_MACHINE=${SOC}_hs_evm_a72_config
	UBOOT_MACHINE_R5=${SOC}_hs_evm_r5_config
	SYSFW_SOC ?= ${SYSFW_SOC_HS}
endif

__EOF__
}
do_install_append_j7-hs-evm() {
    cat >> ${D}/Rules.make << __EOF__

export TI_SECURE_DEV_PKG=\$(TI_SDK_PATH)/board-support/core-secdev-k3

ifeq (\$(SOC_TYPE),gp)
	UBOOT_MACHINE=${SOC}_evm_a72_config
	UBOOT_MACHINE_R5=${SOC}_evm_r5_config
else
	SYSFW_SOC ?= ${SYSFW_SOC_HS}
endif

__EOF__
}

do_install_append_j7200-evm() {
    cat >> ${D}/Rules.make << __EOF__

export TI_SECURE_DEV_PKG=\$(TI_SDK_PATH)/board-support/core-secdev-k3

ifneq (\$(SOC_TYPE),gp)
	UBOOT_MACHINE=${SOC}_hs_evm_a72_config
	UBOOT_MACHINE_R5=${SOC}_hs_evm_r5_config
	SYSFW_SOC ?= ${SYSFW_SOC_HS}
endif

__EOF__
}
do_install_append_j7200-hs-evm() {
    cat >> ${D}/Rules.make << __EOF__

export TI_SECURE_DEV_PKG=\$(TI_SDK_PATH)/board-support/core-secdev-k3

ifeq (\$(SOC_TYPE),gp)
	UBOOT_MACHINE=${SOC}_evm_a72_config
	UBOOT_MACHINE_R5=${SOC}_evm_r5_config
else
	SYSFW_SOC ?= ${SYSFW_SOC_HS}
endif

__EOF__
}

do_install_append_j721s2-evm() {
    cat >> ${D}/Rules.make << __EOF__

export TI_SECURE_DEV_PKG=\$(TI_SDK_PATH)/board-support/core-secdev-k3

ifneq (\$(SOC_TYPE),gp)
	UBOOT_MACHINE=${SOC}_hs_evm_a72_config
	UBOOT_MACHINE_R5=${SOC}_hs_evm_r5_config
endif

__EOF__
}
do_install_append_j721s2-hs-evm() {
    cat >> ${D}/Rules.make << __EOF__

export TI_SECURE_DEV_PKG=\$(TI_SDK_PATH)/board-support/core-secdev-k3

ifeq (\$(SOC_TYPE),gp)
	UBOOT_MACHINE=${SOC}_evm_a72_config
	UBOOT_MACHINE_R5=${SOC}_evm_r5_config
endif

__EOF__
}

do_install_append_j784s4-evm() {
    cat >> ${D}/Rules.make << __EOF__

export TI_SECURE_DEV_PKG=\$(TI_SDK_PATH)/board-support/core-secdev-k3

__EOF__
}
do_install_append_j784s4-hs-evm() {
    cat >> ${D}/Rules.make << __EOF__

export TI_SECURE_DEV_PKG=\$(TI_SDK_PATH)/board-support/core-secdev-k3

__EOF__
}

PR_append = "_psdkla_20"
