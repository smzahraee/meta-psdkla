RDEPENDS_${PN}_append = " \
        libdrm-dev \
        libion \
        libion-dev \
        websocketd \
        statcol \
        ti-rpmsg-char \
        ti-rpmsg-char-dev \
        libloki \
        boost \
        json-c \
        ocl-gl-headers \
        gdb \
        python3-numpy \
        neo-ai-dlr \
        neo-ai-dlr-dev \
        python3-opencv \
        python3-pip \
        python3-pillow \
        tensorflow-lite \
        onnxruntime \
        dialog \
        udev \
"

RDEPENDS_${PN}_append_j7-evm = "ti-img-rogue-umlibs-dev \
        glsdk-util-scripts \
        oob-demo \
"

RDEPENDS_${PN}_append_j7200-evm = "\
        glsdk-util-scripts \
"

RDEPENDS_${PN}_append_j721s2-evm = "\
        glsdk-util-scripts \
"

PR_append = "_psdkla_2"
