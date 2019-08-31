FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:${THISDIR}/${PN}/${MACHINE}:"

SRC_URI_append = " \
    file://0001-board-ti-common-board_detect-Add-k3-specific-board-d.patch \
    file://0002-board-ti-j721e-evm-Fix-the-board-detection-logic.patch \
    file://0003-power-pmic-tps65941-Add-support-for-tps65941-family-.patch \
    file://0004-power-regulator-tps65941-add-regulator-support.patch \
    file://0005-arm-dts-ti-k3-j721e-Add-support-for-pm2-som.patch \
    file://0006-configs-j721e_evm_r5_defconfig-Enable-TPS65941-PMIC-.patch \
    file://0007-configs-j721e_evm_a72_defconfig-Add-support-for-pm2-.patch \
    file://0008-arm-mach-k3-j721e_init-HACK-to-get-AVS-Class-0-funct.patch \
"
PR_append = "_psdkla"
