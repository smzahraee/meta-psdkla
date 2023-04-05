RDEPENDS:${PN}:append = " \
        libdrm-dev \
        libion \
        libion-dev \
        websocketd \
        ti-rpmsg-char-dev \
        libloki \
        boost \
        json-c \
        ocl-gl-headers \
        gdb \
        dialog \
        udev \
"

RDEPENDS:${PN}:append:j721e-evm = "ti-img-rogue-umlibs-dev \
        glsdk-util-scripts \
        oob-demo \
        wifi-oob \
        hostname-update \
        pmic-fix \
"
RDEPENDS:${PN}:append:j721e-hs-evm = "ti-img-rogue-umlibs-dev \
        glsdk-util-scripts \
        oob-demo \
        wifi-oob \
        hostname-update \
        pmic-fix \
"

RDEPENDS:${PN}:append:j7200-evm = "\
        glsdk-util-scripts \
"
RDEPENDS:${PN}:append:j7200-hs-evm = "\
        glsdk-util-scripts \
"

RDEPENDS:${PN}:append:j721s2-evm = "\
        glsdk-util-scripts \
        oob-demo \
        hostname-update \
"
RDEPENDS:${PN}:append:j721s2-hs-evm = "\
        glsdk-util-scripts \
        oob-demo \
        hostname-update \
"

RDEPENDS:${PN}:append:j784s4-evm = "\
        glsdk-util-scripts \
        oob-demo \
        hostname-update \
"
RDEPENDS:${PN}:append:j784s4-hs-evm = "\
        glsdk-util-scripts \
        oob-demo \
        hostname-update \
"

PR:append = "_psdkla_9"
