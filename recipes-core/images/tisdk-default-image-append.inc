# disable matrix gui for PSDKLA
IMAGE_INSTALL:remove = "\
    packagegroup-arago-tisdk-matrix \
    packagegroup-arago-tisdk-matrix-extra \
"

IMAGE_INSTALL:append = " \
    packagegroup-arago-gst-sdk-target \
"

WIC_CREATE_EXTRA_ARGS += " --no-fstab-update"

PR:append = "_psdkla_16"
