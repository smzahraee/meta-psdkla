PR:append = "_psdkla_19"

# Set DTB filters for each machine.  Use "unknown" by default to avoid
# picking up DTB files for devices with no DTB support.
DTB_FILTER:j721s2 = "j721s2\|am68"
DTB_FILTER:j784s4 = "j784s4\|am69"

# Avoid building bootstrap-image while generating tisdk-core-bundle for PROC SDK
TARGET_IMAGES:remove = "tisdk-bootstrap-image"

DEPLOY_SPL_NAME:append:j721s2 = " tiboot3-j721s2-gp-evm.bin tiboot3-j721s2-hs-fs-evm.bin"
DEPLOY_SPL_NAME:append:j784s4 = " tiboot3-j784s4-gp-evm.bin tiboot3-j784s4-hs-fs-evm.bin"

DEPLOY_IMAGES_NAME:append = " u-boot.img Image"

# Add packagegroup to deploy sources in SDK installer
IMAGE_INSTALL:append = " \
    packagegroup-arago-tisdk-sourceipks-sdk-host \
"
