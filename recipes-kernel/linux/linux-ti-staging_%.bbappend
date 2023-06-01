FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:${THISDIR}/${PN}/${MACHINE}:"

SRC_URI:append:j721e = " \
    file://0001-arm64-dts-ti-j721e-ina226-Porting-to-5.10-branch.patch \
"

PR:append = "_psdkla_105"

