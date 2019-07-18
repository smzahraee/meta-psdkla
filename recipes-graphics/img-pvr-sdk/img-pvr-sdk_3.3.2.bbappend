SRCREV = "e76ae77b27ef570e7b8494c3d7067fd3d72b5976"

do_install() {
    CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"

    install -d ${D}${bindir}/SGX/demos/Wayland/

    install -m 755 ${S}/targetfs/arm64/Examples/Advanced/Wayland/OpenGLESDeferredShading ${D}${bindir}/SGX/demos/Wayland/
    install -m 755 ${S}/targetfs/arm64/Examples/Advanced/Wayland/OpenGLESIntroducingPVRUtils ${D}${bindir}/SGX/demos/Wayland/
    install -m 755 ${S}/targetfs/arm64/Examples/Advanced/Wayland/OpenGLESParticleSystem ${D}${bindir}/SGX/demos/Wayland/
    install -m 755 ${S}/targetfs/arm64/Examples/Advanced/Wayland/OpenGLESImageBasedLighting ${D}${bindir}/SGX/demos/Wayland/
    install -m 755 ${S}/targetfs/arm64/Examples/Advanced/Wayland/OpenGLESIntroducingUIRenderer ${D}${bindir}/SGX/demos/Wayland/

    cp -ar ${S}/targetfs/arm64/Examples/Advanced/Wayland/Assets_OpenGLESDeferredShading ${D}${bindir}/SGX/demos/Wayland/.
    cp -ar ${S}/targetfs/arm64/Examples/Advanced/Wayland/Assets_OpenGLESIntroducingPVRUtils ${D}${bindir}/SGX/demos/Wayland/.
    cp -ar ${S}/targetfs/arm64/Examples/Advanced/Wayland/Assets_OpenGLESParticleSystem ${D}${bindir}/SGX/demos/Wayland/.
    cp -ar ${S}/targetfs/arm64/Examples/Advanced/Wayland/Assets_OpenGLESImageBasedLighting ${D}${bindir}/SGX/demos/Wayland/.
    cp -ar ${S}/targetfs/arm64/Examples/Advanced/Wayland/Assets_OpenGLESIntroducingUIRenderer ${D}${bindir}/SGX/demos/Wayland/.

}

PR_append = "_psdkla"
