
# Update the list of DTB and DTBOs globally.
# This is to ensure that the recipe for ti-tisdk-makefile picks this for generating makefile
KERNEL_DEVICETREE:append:j721e-evm = " \
    ti/k3-j721e-sk-rpi-hdr-ehrpwm.dtbo \
"
KERNEL_DEVICETREE:append:j721e-hs-evm = " \
    ti/k3-j721e-sk-rpi-hdr-ehrpwm.dtbo \
"
