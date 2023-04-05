FILESEXTRAPATHS:prepend := "${THISDIR}/linux-ti-staging:${THISDIR}/linux-ti-staging/${MACHINE}:"

SRC_URI:append:j721e-evm = " \
    file://0001-arm64-dts-ti-j721e-ina226-Porting-to-5.10-branch.patch \
"
SRC_URI:append:j721e-hs-evm = " \
    file://0001-arm64-dts-ti-j721e-ina226-Porting-to-5.10-branch.patch \
"

PR:append = "_psdkla_102"

