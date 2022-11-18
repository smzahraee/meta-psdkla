# disable matrix gui for PSDKLA
IMAGE_INSTALL_remove_j7-evm = "\
    packagegroup-arago-tisdk-matrix \
    packagegroup-arago-tisdk-matrix-extra \
"

IMAGE_INSTALL_remove_j7200-evm = "\
    packagegroup-arago-tisdk-matrix \
    packagegroup-arago-tisdk-matrix-extra \
"

IMAGE_INSTALL_remove_am65xx-evm = "\
    packagegroup-arago-tisdk-matrix \
    packagegroup-arago-tisdk-matrix-extra \
"

IMAGE_INSTALL_remove_j721s2-evm = "\
    packagegroup-arago-tisdk-matrix \
    packagegroup-arago-tisdk-matrix-extra \
"

IMAGE_INSTALL_remove_j784s4-evm = "\
    packagegroup-arago-tisdk-matrix \
    packagegroup-arago-tisdk-matrix-extra \
"

IMAGE_INSTALL_append = " \
        docker \
        packagegroup-arago-gst-sdk-target \
        packagegroup-python3-jupyter \
"

WKS_FILE = "edgeai-sdimage.wks"

PR_append = "_psdkla_4"
