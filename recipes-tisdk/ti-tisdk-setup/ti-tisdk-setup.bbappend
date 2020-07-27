FILESEXTRAPATHS_append := ":${THISDIR}/${PN}"

SRC_URI_append = " \
	file://0001-setup-targetfs-nfs-Update-the-rootfs-to-default.patch \
	file://0001-create-sdcard-Update-the-rootfs-to-default.patch \
"

PR_append = "_psdkla"
