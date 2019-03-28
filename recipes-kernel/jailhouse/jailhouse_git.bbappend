FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
    file://0001-configs-j721e-dss-resource-partioning-revision.patch\
    file://0002-configs-j721e-shared-DDR-region-across-all-cells.patch\
"


PR_append = "_psdkla_1"
