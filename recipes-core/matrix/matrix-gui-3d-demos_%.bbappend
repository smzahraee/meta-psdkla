FILESEXTRAPATHS_append := "${THISDIR}/${PN}:"

SRC_URI += " \
file://0001-3d_kmscube-Terminate-the-kmscube-with-timeout.patch \
"
PATCHTOOL = "git"

PR_append = "_psdkla_1"
