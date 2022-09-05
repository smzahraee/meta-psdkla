FILESEXTRAPATHS_append := ":${THISDIR}/${PN}"

DM_FILTER_j7-evm-k3r5 = "j721e"
DM_FILTER_j7200-evm-k3r5 = "j7200"
DM_FILTER_j721s2-evm-k3r5 = "j721s2"

SYSFW_DM = "${S}/ti-dm/${DM_FILTER}/ipc_echo_testb_mcu1_0_release_strip.xer5f"

SYSFW_BASE_HS = "${SYSFW_PREFIX}-${SYSFW_SOC}-hs"

SYSFW_BASE_HS_SR1_1 = "${SYSFW_PREFIX}-${SYSFW_SOC}_sr1_1-hs"

SYSFW_BASE_HS_SR2 = "${SYSFW_PREFIX}-${SYSFW_SOC}_sr2-hs"

SYSFW_HS_PATH="${S}/ti-sysfw/${SYSFW_BASE_HS}-enc.bin"

SYSFW_HS_PATH_SR1_1="${S}/ti-sysfw/${SYSFW_BASE_HS_SR1_1}-enc.bin"

SYSFW_HS_PATH_SR2="${S}/ti-sysfw/${SYSFW_BASE_HS_SR2}-enc.bin"

SYSFW_HS_INNER_CERT_PATH="${S}/ti-sysfw/${SYSFW_BASE_HS}-cert.bin"

SYSFW_HS_INNER_CERT_PATH_SR1_1="${S}/ti-sysfw/${SYSFW_BASE_HS_SR1_1}-cert.bin"

SYSFW_HS_INNER_CERT_PATH_SR2="${S}/ti-sysfw/${SYSFW_BASE_HS_SR2}-cert.bin"

do_deploy_append_j7-evm-k3r5() {
	install -d ${DEPLOYDIR}

	install -m 644 ${SYSFW_DM} ${DEPLOYDIR}/

	# Installing all HS EVM ti-fs
	install -m 644 ${SYSFW_HS_PATH} ${DEPLOYDIR}/
	install -m 644 ${SYSFW_HS_INNER_CERT_PATH} ${DEPLOYDIR}/
	install -m 644 ${SYSFW_HS_PATH_SR1_1} ${DEPLOYDIR}/
	install -m 644 ${SYSFW_HS_INNER_CERT_PATH_SR1_1} ${DEPLOYDIR}/
}

do_deploy_append_j7200-evm-k3r5() {
	install -d ${DEPLOYDIR}

	install -m 644 ${SYSFW_DM} ${DEPLOYDIR}/

	# Installing all HS EVM ti-fs
	install -m 644 ${SYSFW_HS_PATH} ${DEPLOYDIR}/
	install -m 644 ${SYSFW_HS_INNER_CERT_PATH} ${DEPLOYDIR}/
	install -m 644 ${SYSFW_HS_PATH_SR2} ${DEPLOYDIR}/
	install -m 644 ${SYSFW_HS_INNER_CERT_PATH_SR2} ${DEPLOYDIR}/
}

do_deploy_append_j721s2-evm-k3r5() {
	install -d ${DEPLOYDIR}

	install -m 644 ${SYSFW_DM} ${DEPLOYDIR}/

	# Installing all HS EVM ti-fs
	install -m 644 ${SYSFW_HS_PATH} ${DEPLOYDIR}/
	install -m 644 ${SYSFW_HS_INNER_CERT_PATH} ${DEPLOYDIR}/
}


PR_append = "_psdkla_7"
