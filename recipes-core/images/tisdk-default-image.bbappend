# disable matrix gui for PSDKLA
IMAGE_INSTALL_remove_j7-evm = "\
    packagegroup-arago-tisdk-matrix \
    packagegroup-arago-tisdk-matrix-extra \
"

PR_append = "_psdkla"