PR:append = "_psdkla_5"

PSDK_UTILS = " \
    pru-icss \
    corkscrew \
    cmake \
    boost \
    ninja \
    meson \
    opencv \
    opencv-dev \
    python3-pyyaml \
    python3-pycparser \
    python3-plotly \
    python3-cffi \
    python3-numpy \
    python3-pybind11 \
    python3-wheel \
    python3-opencv \
    python3-pip \
    python3-pillow \
"

UTILS:append:j721e-evm = " \
    ${PSDK_UTILS} \
"
UTILS:append:j721e-hs-evm = " \
    ${PSDK_UTILS} \
"

UTILS:append:j721s2-evm = " \
    ${PSDK_UTILS} \
"
UTILS:append:j721s2-hs-evm = " \
    ${PSDK_UTILS} \
"

UTILS:append:j784s4-evm = " \
    ${PSDK_UTILS} \
"
UTILS:append:j784s4-hs-evm = " \
    ${PSDK_UTILS} \
"
