FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:${THISDIR}/${PN}/${MACHINE}:"

SRC_URI:append:j721e-evm = " \
    file://0001-arm64-dts-ti-j721e-ina226-Porting-to-5.10-branch.patch \
"
SRC_URI:append:j721e-hs-evm = " \
    file://0001-arm64-dts-ti-j721e-ina226-Porting-to-5.10-branch.patch \
"

SRC_URI:append:j721s2-evm = " \
    file://0001-arm64-dts-ti-k3-am68-sk-rpi-Override-main_gpio0-node.patch \
"
SRC_URI:append:j721s2-hs-evm = " \
    file://0001-arm64-dts-ti-k3-am68-sk-rpi-Override-main_gpio0-node.patch \
"

PR:append = "_psdkla_103"

