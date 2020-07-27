
# Skip other image types to optimize build
IMAGE_FSTYPES_remove = "wic.xz"

# Update the list of DTB and DTBOs globally.
# This is to ensure that the recipe for ti-tisdk-makefile picks this for generating makefile
KERNEL_DEVICETREE_append_j7-evm = " \
	ti/k3-j721e-vision-apps.dtbo \
	ti/k3-j721e-pcie-backplane.dtbo \
"