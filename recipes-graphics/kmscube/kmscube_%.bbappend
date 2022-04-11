FILESEXTRAPATHS_append := "${THISDIR}/${PN}:"

SRC_URI += " \
file://0001-drm-legacy-Do-not-get-interrupted-by-STDIN.patch \
"

PR_append = "_psdkla_1"
