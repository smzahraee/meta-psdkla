FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append_j7-evm = " \
    file://0001-tiU21.01-PATCH-Optimal-QoS-Settings.patch \
"

SRC_URI_append_j7-evm-k3r5 = " \
    file://0001-tiU21.01-PATCH-Optimal-QoS-Settings.patch \
"

SRC_URI_append_j721s2-evm = " \
    file://0001-eeprom-fix-to-uboot.patch \
    file://0001-mach-k3-Fixing-j721s2_mem_map-to-align-with-j721e_me.patch \
"

SRC_URI_append_j721s2-evm-k3r5 = " \
    file://0001-eeprom-fix-to-uboot.patch \
    file://0001-mach-k3-Fixing-j721s2_mem_map-to-align-with-j721e_me.patch \
"

PR_append = "_psdkla_14"
