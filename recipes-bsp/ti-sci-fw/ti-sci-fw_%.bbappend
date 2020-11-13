FILESEXTRAPATHS_append := ":${THISDIR}/${PN}"

DM_FILTER_j7-evm-k3r5 = "j721e"
DM_FILTER_j7200-evm-k3r5 = "j7200"

SYSFW_DM = "${S}/ti-dm/${DM_FILTER}/ipc_echo_testb_mcu1_0_release_strip.xer5f"

do_deploy_append_j7-evm-k3r5() {
	install -d ${DEPLOYDIR}

	install -m 644 ${SYSFW_DM} ${DEPLOYDIR}/
}

do_deploy_append_j7200-evm-k3r5() {
	install -d ${DEPLOYDIR}

	install -m 644 ${SYSFW_DM} ${DEPLOYDIR}/
}

PR_append = "_psdkla"
