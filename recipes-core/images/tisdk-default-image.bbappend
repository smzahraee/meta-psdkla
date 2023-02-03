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
        packagegroup-arago-gst-sdk-target \
        packagegroup-python3-jupyter \
"

EDGEAI_SDK = " \
        ti-tisdk-firmware-dev \
        ti-tidl-dev \
        ti-tidl-osrt-dev \
        ti-tidl-osrt-staticdev \
        edgeai-gst-apps \
        edgeai-init \
        ti-gpio-cpp \
        ti-gpio-py \
        edgeai-tiovx-kernels-dev \
        edgeai-tiovx-modules-dev \
        edgeai-gst-plugins-dev \
        edgeai-dl-inferer-staticdev \
        edgeai-gst-apps-source \
        edgeai-gst-plugins-source \
        edgeai-tiovx-modules-source \
        edgeai-dl-inferer-source \
        ti-gpio-cpp-source \
        ti-gpio-py-source \
"

IMAGE_INSTALL_append_j7-evm = " \
	${EDGEAI_SDK} \
"

IMAGE_INSTALL_append_j721s2-evm = " \
	${EDGEAI_SDK} \
"

WKS_FILE = "edgeai-sdimage.wks"
WIC_CREATE_EXTRA_ARGS += " --no-fstab-update"

IMAGE_FSTYPES_remove = "wic.bmap"

PR_append = "_psdkla_11"
