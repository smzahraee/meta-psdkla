PR:append = "_psdkla_20"

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

tisdk_image_build:append() {
    if [ -d "${DEPLOY_DIR_IMAGE}/ti-sysfw" ]
    then
        cp -r ${DEPLOY_DIR_IMAGE}/ti-sysfw ${prebuilt_dir}/
    fi

    if [ -d "${DEPLOY_DIR_IMAGE}/ti-dm" ]
    then
        cp -r ${DEPLOY_DIR_IMAGE}/ti-dm ${prebuilt_dir}/
    fi
}
