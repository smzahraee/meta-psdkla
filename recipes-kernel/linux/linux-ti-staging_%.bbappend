FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:${THISDIR}/${PN}/${MACHINE}:"

SRC_URI_append_j7-evm = " \
	file://0001-ti_config_fragments-v8_ipc-enable-rpmsg_char.patch\
	file://0002-rpmsg-char-enhancements.patch\
	file://0003-arm64-dts-j721e-remove-unnecessary-memory-reserve.patch\
	file://0004-arm64-dts-j721e-jailhouse-Aligned-display-split-for-.patch\
	file://0005-arm64-dts-j721e-psdkrtos-Aligned-display-split-for-f.patch\
"

PR_append = "_psdkla_1"
