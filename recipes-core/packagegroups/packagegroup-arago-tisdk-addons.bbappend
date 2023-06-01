PR:append = "_psdkla_8"

PSDK_UTILS = " \
    corkscrew \
    cmake \
    boost \
    ninja \
    meson \
    opencv \
    opencv-dev \
    python3-pyyaml \
    python3-pycparser \
    python3-cffi \
    python3-numpy \
    python3-pybind11 \
    python3-wheel \
    python3-opencv \
    python3-pip \
    python3-pillow \
"

UTILS:append:j721e = " \
    ${PSDK_UTILS} \
    pru-icss \
"

UTILS:append:j721s2 = " \
    ${PSDK_UTILS} \
"

UTILS:append:j784s4 = " \
    ${PSDK_UTILS} \
"
