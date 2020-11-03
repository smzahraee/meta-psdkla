FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:${THISDIR}/${PN}/${MACHINE}:"

SRC_URI_remove = "\
    git://github.com/jthornber/thin-provisioning-tools \
"

SRC_URI_append = "\
    git://github.com/jthornber/thin-provisioning-tools;branch=main \
"

SRCREV = "c42b623e39667b4cbc8c3a7362ba1a97ab09f436"

PR_append = "_psdkla"
