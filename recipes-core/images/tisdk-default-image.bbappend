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

IMAGE_INSTALL_append_j7-evm = " \
        ti-tisdk-firmware-dev \
        ti-tidl-dev \
        ti-tidl-osrt-dev \
        ti-tidl-osrt-staticdev \
        edgeai-apps \
        edgeai-init \
        ti-gpio-cpp \
        ti-gpio-py \
        edgeai-tiovx-modules-dev \
        edgeai-gst-plugins-dev \
        edgeai-dl-inferer-staticdev \
        edgeai-apps-source \
        edgeai-gst-plugins-source \
        edgeai-tiovx-modules-source \
        edgeai-dl-inferer-source \
        ti-gpio-cpp-source \
        ti-gpio-py-source \
"

IMAGE_INSTALL_append_j721s2-evm = " \
        ti-tisdk-firmware-dev \
        ti-tidl-dev \
        ti-tidl-osrt-dev \
        ti-tidl-osrt-staticdev \
        edgeai-apps \
        edgeai-init \
        ti-gpio-cpp \
        ti-gpio-py \
        edgeai-tiovx-modules-dev \
        edgeai-gst-plugins-dev \
        edgeai-dl-inferer-staticdev \
        edgeai-apps-source \
        edgeai-gst-plugins-source \
        edgeai-tiovx-modules-source \
        edgeai-dl-inferer-source \
        ti-gpio-cpp-source \
        ti-gpio-py-source \
"

WKS_FILE = "edgeai-sdimage.wks"
WIC_CREATE_EXTRA_ARGS += " --no-fstab-update"

PR_append = "_psdkla_7"
