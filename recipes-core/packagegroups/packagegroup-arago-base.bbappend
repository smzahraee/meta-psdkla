RDEPENDS_${PN}_append = " \
        rpmsg-char-helper \
        rpmsg-char-helper-dev \
        libdrm-dev \
        libion \
        libion-dev \
        websocketd \
        statcol \
        libloki \
        boost \
        json-c \
        ocl-gl-headers \
        gdb \
        python3-numpy \
        neo-ai-dlr \
        neo-ai-dlr-tests \
        neo-ai-dlr-dev \
"

RDEPENDS_${PN}_append_j7-evm = "ti-img-rogue-umlibs-dev \
        glsdk-util-scripts \
        oob-demo \
"
PR_append = "_psdkla"
