FILESEXTRAPATHS:append := ":${THISDIR}/${PN}"

SRC_URI:append = " \
	file://0001-TFTP-Fixing-tftp-setup-script.patch \
"

PR:append = "_psdkla_4"
