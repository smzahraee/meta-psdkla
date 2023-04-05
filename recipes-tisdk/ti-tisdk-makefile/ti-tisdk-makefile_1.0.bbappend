FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:${THISDIR}/${PN}/${MACHINE}:"

SRC_URI:append:j7 = "\
    file://Makefile_u-boot-spl-jacinto \
    file://Makefile_sysfw-image-jacinto \
    file://Makefile_linux-jacinto \
    file://Makefile_linux-dtbs-jacinto \
"

SRC_URI:remove:j7 = "\
    file://Makefile_ti-ipc \
    file://Makefile_pru-icss \
    file://Makefile_u-boot-spl \
    file://Makefile_sysfw-image \
    file://Makefile_linux \
    file://Makefile_linux-dtbs \
"

MAKEFILES:remove:j7 = " \
    ti-ipc \
    pru-icss \
    u-boot-spl \
    sysfw-image \
    linux-dtbs \
"

MAKEFILES_COMMON:remove:j7 = " \
    linux \
    matrix-gui \
"

MAKEFILES:append:j7 = " \
    u-boot-spl-jacinto \
    sysfw-image-jacinto \
    linux-jacinto \
    linux-dtbs-jacinto \
"

MAKEFILES:remove:j7200-evm = " \
    ti-img-rogue-driver \
"
MAKEFILES:remove:j7200-hs-evm = " \
    ti-img-rogue-driver \
"

MAKEFILES:remove:j721s2-evm = " \
    ti-img-rogue-driver \
"
MAKEFILES:remove:j721s2-hs-evm = " \
    ti-img-rogue-driver \
"

MAKEFILES:remove:j784s4-evm = " \
    ti-img-rogue-driver \
"
MAKEFILES:remove:j784s4-hs-evm = " \
    ti-img-rogue-driver \
"


SOC = "unknown"
SOC:j721e-evm = "j721e"
SOC:j7200-evm = "j7200"
SOC:j721s2-evm = "j721s2"
SOC:j784s4-evm = "j784s4"
SOC:j721e-hs-evm = "j721e"
SOC:j7200-hs-evm = "j7200"
SOC:j721s2-hs-evm = "j721s2"
SOC:j784s4-hs-evm = "j784s4"

SOC_TYPE = "gp"
SOC_TYPE:j721e-hs-evm = "hs"
SOC_TYPE:j7200-hs-evm = "hs"
SOC_TYPE:j721s2-hs-evm = "hs"
SOC_TYPE:j784s4-hs-evm = "hs"

SYSFW_SOC_HS = "${SOC}"
SYSFW_SOC_HS:j721e-evm = "${SOC}_sr1_1"
SYSFW_SOC_HS:j721e-hs-evm = "${SOC}_sr1_1"
SYSFW_SOC_HS:j7200-evm = "${SOC}_sr2"
SYSFW_SOC_HS:j7200-hs-evm = "${SOC}_sr2"

K3_UBOOT_MACHINE_R5:j7200-hs-evm = "j7200_hs_evm_r5_config"
K3_UBOOT_MACHINE_R5:j721s2-hs-evm = "j721s2_hs_evm_r5_config"

do_install:append:j7() {
    cat ${D}/Makefile | grep "__DTB_DEPEND_STAGE__" > /dev/null
    if [ "$?" == "0" ]
    then
        sed -i -e "s/__DTB_DEPEND_STAGE__/linux-dtbs_stage/" ${D}/Makefile
    else
        sed -i -e "s/__DTB_DEPEND_STAGE__//" ${D}/Makefile
    fi

    sed -i -e "s/^PLATFORM=.*/&\nSOC = ${SOC}\nSOC_TYPE ?= ${SOC_TYPE}/g" ${D}/Rules.make

    cat >> ${D}/Rules.make << __EOF__

# Root of the boot partition to install boot binaries
BOOTFS ?= __BOOTFS__
__EOF__
}

do_install:append:j721e-evm() {
    cat >> ${D}/Rules.make << __EOF__

export TI_SECURE_DEV_PKG=\$(TI_SDK_PATH)/board-support/core-secdev-k3

ifneq (\$(SOC_TYPE),gp)
	UBOOT_MACHINE=${SOC}_hs_evm_a72_config
	UBOOT_MACHINE_R5=${SOC}_hs_evm_r5_config
	SYSFW_SOC ?= ${SYSFW_SOC_HS}
endif

__EOF__
}
do_install:append:j721e-hs-evm() {
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

do_install:append:j7200-evm() {
    cat >> ${D}/Rules.make << __EOF__

export TI_SECURE_DEV_PKG=\$(TI_SDK_PATH)/board-support/core-secdev-k3

ifneq (\$(SOC_TYPE),gp)
	UBOOT_MACHINE=${SOC}_hs_evm_a72_config
	UBOOT_MACHINE_R5=${SOC}_hs_evm_r5_config
	SYSFW_SOC ?= ${SYSFW_SOC_HS}
endif

__EOF__
}
do_install:append:j7200-hs-evm() {
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

do_install:append:j721s2-evm() {
    cat >> ${D}/Rules.make << __EOF__

export TI_SECURE_DEV_PKG=\$(TI_SDK_PATH)/board-support/core-secdev-k3

ifneq (\$(SOC_TYPE),gp)
	UBOOT_MACHINE=${SOC}_hs_evm_a72_config
	UBOOT_MACHINE_R5=${SOC}_hs_evm_r5_config
endif

__EOF__
}
do_install:append:j721s2-hs-evm() {
    cat >> ${D}/Rules.make << __EOF__

export TI_SECURE_DEV_PKG=\$(TI_SDK_PATH)/board-support/core-secdev-k3

ifeq (\$(SOC_TYPE),gp)
	UBOOT_MACHINE=${SOC}_evm_a72_config
	UBOOT_MACHINE_R5=${SOC}_evm_r5_config
endif

__EOF__
}

do_install:append:j784s4-evm() {
    cat >> ${D}/Rules.make << __EOF__

export TI_SECURE_DEV_PKG=\$(TI_SDK_PATH)/board-support/core-secdev-k3

__EOF__
}
do_install:append:j784s4-hs-evm() {
    cat >> ${D}/Rules.make << __EOF__

export TI_SECURE_DEV_PKG=\$(TI_SDK_PATH)/board-support/core-secdev-k3

__EOF__
}

PR:append = "_psdkla_22"
