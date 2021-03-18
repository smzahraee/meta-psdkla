
# Skip other image types to optimize build
IMAGE_FSTYPES_remove = "wic.xz"

# Update the list of DTB and DTBOs globally.
# This is to ensure that the recipe for ti-tisdk-makefile picks this for generating makefile
KERNEL_DEVICETREE_append_j7-evm = " \
	ti/k3-j721e-vision-apps.dtbo \
	ti/k3-j721e-pcie-backplane.dtbo \
"

# Update the list of DTB and DTBOs globally.
# This is to ensure that the recipe for ti-tisdk-makefile picks this for generating makefile
KERNEL_DEVICETREE_append_j7200-evm = " \
	ti/k3-j7200-dra821a.dtbo \
"

CREATE_SRCIPK_pn-ti-img-encode-decode = "1"
SRCIPK_INSTALL_DIR_pn-ti-img-encode-decode = "board-support/extra-drivers/${PN}-${PV}"
SRCIPK_PRESERVE_GIT_pn-ti-img-encode-decode = "true"
