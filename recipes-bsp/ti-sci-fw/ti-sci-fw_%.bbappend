FILESEXTRAPATHS:append := ":${THISDIR}/${PN}"

DM_FILTER:j721e-evm-k3r5 = "j721e"
DM_FILTER:j721e-hs-evm-k3r5 = "j721e"
DM_FILTER:j7200-evm-k3r5 = "j7200"
DM_FILTER:j7200-hs-evm-k3r5 = "j7200"
DM_FILTER:j721s2-evm-k3r5-gp = "j721s2"
DM_FILTER:j721s2-hs-evm-k3r5 = "j721s2"
DM_FILTER:j784s4-evm-k3r5-gp = "j784s4"
DM_FILTER:j784s4-hs-evm-k3r5 = "j784s4"

SYSFW_DM = "${S}/ti-dm/${DM_FILTER}/ipc_echo_testb_mcu1_0_release_strip.xer5f"


SYSFW_TISCI_SR1_1 = "${S}/ti-sysfw/ti-${SYSFW_PREFIX}-firmware-${SYSFW_SOC}_sr1_1-*.bin"
SYSFW_TISCI_SR2 = "${S}/ti-sysfw/ti-${SYSFW_PREFIX}-firmware-${SYSFW_SOC}_sr2-*.bin"


do_deploy:append:j721e-evm-k3r5() {
	install -d ${DEPLOYDIR}

	install -m 644 ${SYSFW_DM} ${DEPLOYDIR}/

	# Installing all sr1_1 & sr2 EVM ti-fs
	install -m 644 ${SYSFW_TISCI_SR1_1} ${DEPLOYDIR}/
	install -m 644 ${SYSFW_TISCI_SR2} ${DEPLOYDIR}/
}
do_deploy:append:j721e-hs-evm-k3r5() {
	install -d ${DEPLOYDIR}

	install -m 644 ${SYSFW_DM} ${DEPLOYDIR}/

	# Installing all sr1_1 & sr2 EVM ti-fs
	install -m 644 ${SYSFW_TISCI_SR1_1} ${DEPLOYDIR}/
	install -m 644 ${SYSFW_TISCI_SR2} ${DEPLOYDIR}/
}

do_deploy:append:j7200-evm-k3r5() {
	install -d ${DEPLOYDIR}

	install -m 644 ${SYSFW_DM} ${DEPLOYDIR}/

	# Installing all sr2 EVM ti-fs
	install -m 644 ${SYSFW_TISCI_SR2} ${DEPLOYDIR}/
}
do_deploy:append:j7200-hs-evm-k3r5() {
	install -d ${DEPLOYDIR}

	install -m 644 ${SYSFW_DM} ${DEPLOYDIR}/
}

do_deploy:append:j721s2-evm-k3r5-gp() {
	install -d ${DEPLOYDIR}

	install -m 644 ${SYSFW_DM} ${DEPLOYDIR}/
}
do_deploy:append:j721s2-hs-evm-k3r5() {
	install -d ${DEPLOYDIR}

	install -m 644 ${SYSFW_DM} ${DEPLOYDIR}/
}

do_deploy:append:j784s4-evm-k3r5-gp() {
	install -d ${DEPLOYDIR}

	install -m 644 ${SYSFW_DM} ${DEPLOYDIR}/
}
do_deploy:append:j784s4-hs-evm-k3r5() {
	install -d ${DEPLOYDIR}

	install -m 644 ${SYSFW_DM} ${DEPLOYDIR}/
}

PR:append = "_psdkla_15"
