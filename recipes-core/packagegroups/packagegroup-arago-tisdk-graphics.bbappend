# These dev packages are needed to build PTK apps against PSDKLA filesystem.
RDEPENDS_${PN}_append = "\
    ${PREFERRED_PROVIDER_virtual/egl}-dev \
    wayland-dev \
    weston-dev \
    glm-dev \
    devil-dev \
    libpng-dev \
    img-pvr-sdk \
"

PR_append = "_psdkla"
