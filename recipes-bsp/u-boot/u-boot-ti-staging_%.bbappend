FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append_j7-evm = " \
    file://0001-tiU21.01-PATCH-Optimal-QoS-Settings.patch \
"

SRC_URI_append_j7-evm-k3r5 = " \
    file://0001-tiU21.01-PATCH-Optimal-QoS-Settings.patch \
"

SRC_URI_append_j721s2-evm = " \
    file://0001-tools-k3_fit_atf-Fix-DM-binary-FIT-load-addresses.patch \
"

SRC_URI_append_j721s2-evm-k3r5 = " \
    file://0001-tools-k3_fit_atf-Fix-DM-binary-FIT-load-addresses.patch \
"

PR_append = "_psdkla_11"
