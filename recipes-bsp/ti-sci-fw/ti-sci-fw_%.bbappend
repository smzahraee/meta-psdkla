FILESEXTRAPATHS_append := ":${THISDIR}/${PN}"

TI_LINUX_FW_SRCREV = "760434de173d1957823042b3c2daf0f45e1191cd"
K3_IMAGE_GEN_SRCREV = "184ab513e6acb161c5f77a593ef976f3a4d93cda"

DM_FILTER_j7-evm-k3r5 = "j721e"
DM_FILTER_j7-hs-evm-k3r5 = "j721e"
DM_FILTER_j7200-evm-k3r5 = "j7200"
DM_FILTER_j7200-hs-evm-k3r5 = "j7200"
DM_FILTER_j721s2-evm-k3r5-gp = "j721s2"
DM_FILTER_j721s2-hs-evm-k3r5 = "j721s2"
DM_FILTER_j784s4-evm-k3r5-gp = "j784s4"
DM_FILTER_j784s4-hs-evm-k3r5 = "j784s4"

SYSFW_DM = "${S}/ti-dm/${DM_FILTER}/ipc_echo_testb_mcu1_0_release_strip.xer5f"


SYSFW_TISCI_SR1_1 = "${S}/ti-sysfw/ti-${SYSFW_PREFIX}-firmware-${SYSFW_SOC}_sr1_1-*.bin"
SYSFW_TISCI_SR2 = "${S}/ti-sysfw/ti-${SYSFW_PREFIX}-firmware-${SYSFW_SOC}_sr2-*.bin"


do_deploy_append_j7-evm-k3r5() {
	install -d ${DEPLOYDIR}

	install -m 644 ${SYSFW_DM} ${DEPLOYDIR}/

	# Installing all sr1_1 & sr2 EVM ti-fs
	install -m 644 ${SYSFW_TISCI_SR1_1} ${DEPLOYDIR}/
	install -m 644 ${SYSFW_TISCI_SR2} ${DEPLOYDIR}/
}
do_deploy_append_j7-hs-evm-k3r5() {
	install -d ${DEPLOYDIR}

	install -m 644 ${SYSFW_DM} ${DEPLOYDIR}/

	# Installing all sr1_1 & sr2 EVM ti-fs
	install -m 644 ${SYSFW_TISCI_SR1_1} ${DEPLOYDIR}/
	install -m 644 ${SYSFW_TISCI_SR2} ${DEPLOYDIR}/
}

do_deploy_append_j7200-evm-k3r5() {
	install -d ${DEPLOYDIR}

	install -m 644 ${SYSFW_DM} ${DEPLOYDIR}/

	# Installing all sr2 EVM ti-fs
	install -m 644 ${SYSFW_TISCI_SR2} ${DEPLOYDIR}/
}
do_deploy_append_j7200-hs-evm-k3r5() {
	install -d ${DEPLOYDIR}

	install -m 644 ${SYSFW_DM} ${DEPLOYDIR}/
}

do_deploy_append_j721s2-evm-k3r5-gp() {
	install -d ${DEPLOYDIR}

	install -m 644 ${SYSFW_DM} ${DEPLOYDIR}/
}
do_deploy_append_j721s2-hs-evm-k3r5() {
	install -d ${DEPLOYDIR}

	install -m 644 ${SYSFW_DM} ${DEPLOYDIR}/
}

do_deploy_append_j784s4-evm-k3r5-gp() {
	install -d ${DEPLOYDIR}

	install -m 644 ${SYSFW_DM} ${DEPLOYDIR}/
}
do_deploy_append_j784s4-hs-evm-k3r5() {
	install -d ${DEPLOYDIR}

	install -m 644 ${SYSFW_DM} ${DEPLOYDIR}/
}

PR_append = "_psdkla_14"
