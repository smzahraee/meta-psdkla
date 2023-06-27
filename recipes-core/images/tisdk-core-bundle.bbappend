PR:append = "_psdkla_21"

# Set DTB filters for each machine.  Use "unknown" by default to avoid
# picking up DTB files for devices with no DTB support.
DTB_FILTER:j721s2 = "j721s2\|am68"
DTB_FILTER:j784s4 = "j784s4\|am69"

# Avoid building bootstrap-image while generating tisdk-core-bundle for PROC SDK
TARGET_IMAGES:remove = "tisdk-bootstrap-image"

DEPLOY_IMAGES_NAME:append = " tiboot3.bin Image fitImage fitImage-its-${MACHINE}"

# Add packagegroup to deploy sources in SDK installer
IMAGE_INSTALL:append = " \
    packagegroup-arago-tisdk-sourceipks-sdk-host \
"

SW_MANIFEST_FILE = "${IMAGE_ROOTFS}/manifest/software_manifest.htm"
SW_MANIFEST_TEXT = "${IMAGE_ROOTFS}/manifest/software_manifest.txt"
PREBUILT_DIR = "${IMAGE_ROOTFS}/board-support/prebuilt-images"


tisdk_image_build:prepend() {
    if [ -d "${DEPLOY_DIR_IMAGE}/ti-sysfw" ]
    then
        cp -r ${DEPLOY_DIR_IMAGE}/ti-sysfw ${PREBUILT_DIR}/
    fi

    if [ -d "${DEPLOY_DIR_IMAGE}/ti-dm" ]
    then
        cp -r ${DEPLOY_DIR_IMAGE}/ti-dm ${PREBUILT_DIR}/
    fi

    # Copy the licenses directory in the $DEPLOY_DIR to capture all
    # the licenses that were used in the build.
    if [ -d ${DEPLOY_DIR}/licenses ]
    then
        cp -rf ${DEPLOY_DIR}/licenses ${IMAGE_ROOTFS}/
    fi

    if [ ! -d ${IMAGE_ROOTFS}/manifest ]
    then
        mkdir -p ${IMAGE_ROOTFS}/manifest
    fi
}
