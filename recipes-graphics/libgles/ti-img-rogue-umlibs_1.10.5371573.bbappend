FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += " \
    file://0001-wayland-Update-headers-to-latest.patch \
"

PR_append = "_psdkla"
