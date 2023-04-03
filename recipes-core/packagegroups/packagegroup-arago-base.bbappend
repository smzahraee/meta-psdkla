RDEPENDS_${PN}_append = " \
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

RDEPENDS_${PN}_append_j7-evm = "ti-img-rogue-umlibs-dev \
        glsdk-util-scripts \
        oob-demo \
        wifi-oob \
        hostname-update \
        pmic-fix \
"
RDEPENDS_${PN}_append_j7-hs-evm = "ti-img-rogue-umlibs-dev \
        glsdk-util-scripts \
        oob-demo \
        wifi-oob \
        hostname-update \
        pmic-fix \
"

RDEPENDS_${PN}_append_j7200-evm = "\
        glsdk-util-scripts \
"
RDEPENDS_${PN}_append_j7200-hs-evm = "\
        glsdk-util-scripts \
"

RDEPENDS_${PN}_append_j721s2-evm = "\
        glsdk-util-scripts \
        oob-demo \
        hostname-update \
"
RDEPENDS_${PN}_append_j721s2-hs-evm = "\
        glsdk-util-scripts \
        oob-demo \
        hostname-update \
"

RDEPENDS_${PN}_append_j784s4-evm = "\
        glsdk-util-scripts \
        oob-demo \
        hostname-update \
"
RDEPENDS_${PN}_append_j784s4-hs-evm = "\
        glsdk-util-scripts \
        oob-demo \
        hostname-update \
"

PR_append = "_psdkla_9"
