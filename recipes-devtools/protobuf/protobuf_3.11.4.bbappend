EXTRAPATHS_prepend := "${THISDIR}/${PN}:${THISDIR}/${PN}/${MACHINE}:"

SRC_URI_remove = "\
    git://github.com/google/protobuf.git;branch=3.11.x \
"

SRC_URI_append = "\
    git://github.com/google/protobuf.git;branch=master \
"

PR_append = "_psdkla"
