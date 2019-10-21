FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
        file://0001-Virt-Fix-init-scripts-to-load-virt-drivers.patch \
"

PR_append = "_psdkla"
