FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:${THISDIR}/${PN}/${MACHINE}:"

SRC_URI_append_j721s2-evm = " \
    file://0001-common-socinfo-add-j721s2-device-identification.patch \
    file://0002-soc-j721s2-add-device-description-information.patch \
    file://0003-soc-j721s2-add-host-description-information.patch \
    file://0004-soc-j721s2-add-clock-identifier-information.patch \
    file://0005-soc-j721s2-add-processor-description-information.patch \
    file://0006-soc-j721s2-add-resource-assignment-information.patch \
    file://0007-soc-j721s2-add-secure-proxy-information.patch \
    file://0008-readme-add-j721s2-to-the-list-of-supported-chips.patch \
"

PR_append = "_psdkla_2"
