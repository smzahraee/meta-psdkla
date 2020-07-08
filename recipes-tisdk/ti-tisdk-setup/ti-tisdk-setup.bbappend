FILESEXTRAPATHS_append := ":${THISDIR}/${PN}"

SRC_URI_append = " \
	file://0001-setup-targetfs-nfs-Update-the-rootfs-to-default.patch \
"

PR_append = "_psdkla"
