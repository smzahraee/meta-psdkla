FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:${THISDIR}/${PN}/${MACHINE}:"

SRC_URI_append_j721s2-evm = " \
    file://k3conf-1-8-common-socinfo-add-j721s2-device-identification.patch \
    file://k3conf-2-8-soc-j721s2-add-device-description-information.patch \
    file://k3conf-3-8-soc-j721s2-add-host-description-information.patch \
    file://k3conf-4-8-soc-j721s2-add-clock-identifier-information.patch \
    file://k3conf-5-8-soc-j721s2-add-processor-description-information.patch \
    file://k3conf-6-8-soc-j721s2-add-resource-assignment-information.patch \
    file://k3conf-7-8-soc-j721s2-add-secure-proxy-information.patch \
    file://k3conf-8-8-readme-add-j721s2-to-the-list-of-supported-chips.patch \
"

PR_append = "_psdkla_1"
