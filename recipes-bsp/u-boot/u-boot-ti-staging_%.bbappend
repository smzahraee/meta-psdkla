FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:${THISDIR}/${PN}/${MACHINE}:"

SRC_URI_append_am57xx-evm = " \
	file://0001-spl-spi-Create-an-API-spl_spi_load_firmware.patch \
	file://0002-arm-mach-omap2-load-remoteproc-IPU1-IPU2-from-SPI.patch \
	file://0003-board-ti-am57xx-Fix-operator-precedence-issue.patch \
"
PATCHTOOL = "git"

PR_append = "_psdkla_4"
