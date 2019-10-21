FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:${THISDIR}/${PN}/${MACHINE}:"

SRC_URI += "\
    file://Makefile_ti-img-rogue-driver \
    file://Makefile_ti-img-encode-decode \
"

SRC_URI_remove_j7-evm = "\
    file://Makefile_matrix-gui \
    file://Makefile_matrix-gui-browser \
"

MAKEFILES_COMMON_remove_j7-evm = "\
    matrix-gui \
    matrix-gui-browser \
"

MAKEFILES_append_j7-evm = " \
    ti-img-rogue-driver \
    ti-img-encode-decode \
"

MAKEFILES_remove_j7-evm = " \
    pru-icss \
"

PR_append = "_psdkla"
