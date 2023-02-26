# disable matrix gui for PSDKLA
IMAGE_INSTALL_remove = "\
    packagegroup-arago-tisdk-matrix \
    packagegroup-arago-tisdk-matrix-extra \
"

IMAGE_INSTALL_append = " \
        packagegroup-arago-gst-sdk-target \
        packagegroup-python3-jupyter \
"

WKS_FILE = "tisdk-default-sdimage.wks"
WIC_CREATE_EXTRA_ARGS += " --no-fstab-update"

PR_append = "_psdkla_15"
