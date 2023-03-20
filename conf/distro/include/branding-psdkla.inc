
# Update the list of DTB and DTBOs globally.
# This is to ensure that the recipe for ti-tisdk-makefile picks this for generating makefile
KERNEL_DEVICETREE_append_j7-evm = " \
    ti/k3-j721e-sk-rpi-hdr-ehrpwm.dtbo \
"
KERNEL_DEVICETREE_append_j7-hs-evm = " \
    ti/k3-j721e-sk-rpi-hdr-ehrpwm.dtbo \
"
