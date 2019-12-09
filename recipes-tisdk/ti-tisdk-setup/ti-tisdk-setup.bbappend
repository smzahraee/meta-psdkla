FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:${THISDIR}/${PN}/${MACHINE}:"

SRC_URI_append = " \
    file://0001-setup-targetfs-nfs-Update-command-to-replace-Rules.m.patch \
"

SRCREV = "2edc63a57804b7b4401a355d9ccb9133817f6333"

PR_append = "_psdkla"
