FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append_j7-evm = " \
    file://0001-Optimal-QoS-Configuration.patch \
"

PR_append = "_psdkla_1"
