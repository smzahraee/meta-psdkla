
# Update the list of DTB and DTBOs globally.
# This is to ensure that the recipe for ti-tisdk-makefile picks this for generating makefile
KERNEL_DEVICETREE_append_j7-evm = " \
    ti/k3-j721e-vision-apps.dtbo \
    ti/k3-j721e-edgeai-apps.dtbo \
    ti/k3-j721e-sk-rpi-hdr-ehrpwm.dtbo \
"

KERNEL_DEVICETREE_append_j721s2-evm = " \
    ti/k3-j721s2-vision-apps.dtbo \
    ti/k3-j721s2-edgeai-apps.dtbo \
	ti/k3-am68-sk-reve1-base-board.dtb \
	ti/k3-am68-sk-reve1-bb-csi2-ov5640.dtbo \
	ti/k3-am68-sk-reve1-bb-rpi-cam-imx219.dtbo \
"

KERNEL_DEVICETREE_append_j784s4-evm = " \
    ti/k3-j784s4-vision-apps.dtbo \
    ti/k3-j784s4-edgeai-apps.dtbo \
"
