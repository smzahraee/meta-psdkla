# Produces wic Image for Analytics demos

require recipes-core/images/tisdk-default-image.bb
require tisdk-default-image-append.inc

COMPATIBLE_MACHINE = "j7-evm|j7-hs-evm|j721s2-evm|j721s2-hs-evm|j784s4-evm|j784s4-hs-evm|am62axx-evm"

EDGEAI_STACK = " \
        ti-tisdk-firmware-dev \
        ti-tidl-dev \
        ti-tidl-osrt-dev \
        ti-tidl-osrt-staticdev \
        edgeai-gst-apps \
        edgeai-init \
        ti-gpio-cpp \
        ti-gpio-py \
        edgeai-studio-agent \
        edgeai-tiovx-kernels-dev \
        edgeai-tiovx-modules-dev \
        edgeai-gst-plugins-dev \
        edgeai-dl-inferer-staticdev \
        edgeai-gst-apps-source \
        edgeai-gst-plugins-source \
        edgeai-tiovx-kernels-source \
        edgeai-tiovx-modules-source \
        edgeai-dl-inferer-source \
        ti-gpio-cpp-source \
        ti-gpio-py-source \
"

IMAGE_INSTALL_append = " \
	${EDGEAI_STACK} \
"

do_image_wic[depends] += "edgeai-uenv:do_deploy"
IMAGE_BOOT_FILES_remove = "uEnv.txt"
IMAGE_BOOT_FILES_append = " uEnv_edgeai-apps.txt;uEnv.txt "


export IMAGE_BASENAME = "tisdk-analytics-image"

PR_append = "_analytics1"
