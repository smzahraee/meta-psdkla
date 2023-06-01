RDEPENDS:${PN}:append = " \
        libdrm-dev \
        websocketd \
        libloki \
        boost \
        json-c \
        gdb \
        udev \
"

RDEPENDS:${PN}:append:j721e = "\
        glsdk-util-scripts \
        oob-demo \
        wifi-oob \
        hostname-update \
        pmic-fix \
"

RDEPENDS:${PN}:append:j7200 = "\
        glsdk-util-scripts \
"

RDEPENDS:${PN}:append:j721s2 = "\
        glsdk-util-scripts \
        oob-demo \
        hostname-update \
"

RDEPENDS:${PN}:append:j784s4 = "\
        glsdk-util-scripts \
        oob-demo \
        hostname-update \
"

PR:append = "_psdkla_11"
