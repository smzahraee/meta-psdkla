PR:append = "_psdkla_0"

SYSFW_PREFIX = "sci"
SYSFW_PREFIX:j7200-evm = "fs"
SYSFW_PREFIX:j7200-evm-k3r5 = "fs"
SYSFW_PREFIX:j7200-hs-evm = "fs"
SYSFW_PREFIX:j7200-hs-evm-k3r5 = "fs"
SYSFW_PREFIX:j721e-evm = "fs"
SYSFW_PREFIX:j721e-evm-k3r5 = "fs"
SYSFW_PREFIX:j721e-hs-evm = "fs"
SYSFW_PREFIX:j721e-hs-evm-k3r5 = "fs"
SYSFW_PREFIX:j721s2-evm = "fs"
SYSFW_PREFIX:j721s2-evm-k3r5 = "fs"
SYSFW_PREFIX:j721s2-hs-evm = "fs"
SYSFW_PREFIX:j721s2-hs-evm-k3r5 = "fs"
SYSFW_PREFIX:j784s4-evm = "fs"
SYSFW_PREFIX:j784s4-evm-k3r5 = "fs"
SYSFW_PREFIX:j784s4-hs-evm = "fs"
SYSFW_PREFIX:j784s4-hs-evm-k3r5 = "fs"
SYSFW_PREFIX:am62axx-evm = "fs"
SYSFW_PREFIX:am62axx-evm-k3r5 = "fs"

SYSFW_SOC ?= "unknown"

SYSFW_TISCI = "${S}/ti-sysfw/ti-${SYSFW_PREFIX}-firmware-${SYSFW_SOC}*.bin"

inherit deploy

do_deploy() {
    install -d ${DEPLOYDIR}/ti-sysfw
}

do_deploy:append:k3r5() {
    install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/ti-sysfw
}

addtask deploy before do_build after do_compile
