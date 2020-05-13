FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:${THISDIR}/${PN}/${MACHINE}:"

SRC_URI_remove_j7-evm = "\
    file://Makefile_matrix-gui \
    file://Makefile_matrix-gui-browser \
"

MAKEFILES_COMMON_remove_j7-evm = "\
    matrix-gui \
    matrix-gui-browser \
"
MAKEFILES_remove_j7-evm = " \
    pru-icss \
"

PR_append = "_psdkla"
