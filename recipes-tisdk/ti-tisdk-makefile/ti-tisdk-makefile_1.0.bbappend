FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:${THISDIR}/${PN}/${MACHINE}:"

SRC_URI_remove_j7-evm = "\
    file://Makefile_matrix-gui \
    file://Makefile_matrix-gui-browser \
"
SRC_URI_append = "\
    file://Makefile_oob-demo \
"

MAKEFILES_COMMON_remove_j7-evm = "\
    matrix-gui \
    matrix-gui-browser \
"
MAKEFILES_remove_j7-evm = " \
    pru-icss \
"
MAKEFILES_append_j7-evm = " oob-demo \
"

PR_append = "_psdkla"
