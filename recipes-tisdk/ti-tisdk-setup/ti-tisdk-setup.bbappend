FILESEXTRAPATHS_append := ":${THISDIR}/${PN}"

SRC_URI_append = " \
	file://0001-setup-uboot-env-am65x-Adding-sudo-permissions.patch \
	file://0001-TFTP-Fixing-tftp-setup-script.patch \
"

PR_append = "_psdkla_3"
