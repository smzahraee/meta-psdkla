FILESEXTRAPATHS_append := ":${THISDIR}/${PN}"

DM_FILTER_j7-evm-k3r5 = "j721e"
DM_FILTER_j7200-evm-k3r5 = "j7200"
DM_FILTER_j721s2-evm-k3r5 = "j721s2"

SYSFW_DM = "${S}/ti-dm/${DM_FILTER}/ipc_echo_testb_mcu1_0_release_strip.xer5f"


SR_j7-evm-k3r5 = "sr1_1"
SR_j7200-evm-k3r5 = "sr2"

SYSFW_TISCI_SR = "${S}/ti-sysfw/ti-${SYSFW_PREFIX}-firmware-${SYSFW_SOC}_${SR}-*.bin"


do_deploy_append_j7-evm-k3r5() {
	install -d ${DEPLOYDIR}

	install -m 644 ${SYSFW_DM} ${DEPLOYDIR}/

	# Installing all sr1_1 EVM ti-fs
	install -m 644 ${SYSFW_TISCI_SR} ${DEPLOYDIR}/
}

do_deploy_append_j7200-evm-k3r5() {
	install -d ${DEPLOYDIR}

	install -m 644 ${SYSFW_DM} ${DEPLOYDIR}/

	# Installing all sr2 EVM ti-fs
	install -m 644 ${SYSFW_TISCI_SR} ${DEPLOYDIR}/
}

do_deploy_append_j721s2-evm-k3r5() {
	install -d ${DEPLOYDIR}

	install -m 644 ${SYSFW_DM} ${DEPLOYDIR}/
}


PR_append = "_psdkla_8"
