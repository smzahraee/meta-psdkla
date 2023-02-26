PR_append = "_psdkla_4"

PSDK_UTILS = " \
    pru-icss \
    cmake \
    yaml-cpp \
    yaml-cpp-dev \
    python3-pyyaml \
    boost \
    ninja \
    meson \
    opencv \
    opencv-dev \
    corkscrew \
    python3-pycparser \
    python3-plotly \
    python3-cffi \
    zlib \
    python3-numpy \
    python3-pybind11 \
    python3-wheel \
    protobuf \
"

UTILS_append_j7-evm = " \
    ${PSDK_UTILS} \
"
UTILS_append_j7-hs-evm = " \
    ${PSDK_UTILS} \
"

UTILS_append_j721s2-evm = " \
    ${PSDK_UTILS} \
"
UTILS_append_j721s2-hs-evm = " \
    ${PSDK_UTILS} \
"

UTILS_append_j784s4-evm = " \
    ${PSDK_UTILS} \
"
UTILS_append_j784s4-hs-evm = " \
    ${PSDK_UTILS} \
"
