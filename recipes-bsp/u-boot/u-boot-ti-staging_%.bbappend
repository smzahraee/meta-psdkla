FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append_j7-evm = " \
    file://0001-Optimal-QoS-Configuration.patch \
    file://tiU20.01-HACK-arm-dts-k3-j721e-force-GTC-clock-to-be-200MHz.patch \
"

PR_append = "_psdkla"
