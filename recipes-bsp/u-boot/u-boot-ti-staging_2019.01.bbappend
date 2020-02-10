FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:${THISDIR}/${PN}/${MACHINE}:"

SRC_URI_append = " \
    file://0001-arm-dts-k3-j721e-Do-not-use-lockstep-mode-for-Main-R.patch \
"
PR_append = "_psdkla"
