
# Skip other image types to optimize build
IMAGE_FSTYPES_remove = "wic.xz"

# Update the list of DTB and DTBOs globally.
# This is to ensure that the recipe for ti-tisdk-makefile picks this for generating makefile
KERNEL_DEVICETREE_append_j7-evm = "${@oe.utils.conditional("ARAGO_RT_ENABLE", "1", "", " \
    ti/k3-j721e-vision-apps.dtbo \
    ti/k3-j721e-edgeai-apps.dtbo \
    ti/k3-j721e-sk-rpi-hdr-ehrpwm.dtbo \
    ti/k3-j721e-sk-csi2-ov5640.dtbo \
    ti/k3-j721e-sk-rpi-cam-imx219.dtbo \
    ti/k3-j721e-fpdlink-cpb-fusion.dtbo \
    ti/k3-j721e-fpdlink-imx390-cm-0-0.dtbo \
    ti/k3-j721e-fpdlink-imx390-cm-0-1.dtbo \
    ti/k3-j721e-fpdlink-imx390-cm-0-2.dtbo \
    ti/k3-j721e-fpdlink-imx390-cm-0-3.dtbo \
    ti/k3-j721e-fpdlink-imx390-cm-1-0.dtbo \
    ti/k3-j721e-fpdlink-imx390-cm-1-1.dtbo \
    ti/k3-j721e-fpdlink-imx390-cm-1-2.dtbo \
    ti/k3-j721e-fpdlink-imx390-cm-1-3.dtbo \
    ti/k3-j721e-fpdlink-imx390-rcm-0-0.dtbo \
    ti/k3-j721e-fpdlink-imx390-rcm-0-1.dtbo \
    ti/k3-j721e-fpdlink-imx390-rcm-0-2.dtbo \
    ti/k3-j721e-fpdlink-imx390-rcm-0-3.dtbo \
    ti/k3-j721e-fpdlink-imx390-rcm-1-0.dtbo \
    ti/k3-j721e-fpdlink-imx390-rcm-1-1.dtbo \
    ti/k3-j721e-fpdlink-imx390-rcm-1-2.dtbo \
    ti/k3-j721e-fpdlink-imx390-rcm-1-3.dtbo \
    ti/k3-j721e-fpdlink-sk-fusion.dtbo \
", d)}"

KERNEL_DEVICETREE_append_j721s2-evm = "${@oe.utils.conditional("ARAGO_RT_ENABLE", "1", "", "\
    ti/k3-j721s2-vision-apps.dtbo \
", d)}"

KERNEL_DEVICETREE_append_j784s4-evm = "${@oe.utils.conditional("ARAGO_RT_ENABLE", "1", "", "\
    ti/k3-j784s4-vision-apps.dtbo \
", d)}"
