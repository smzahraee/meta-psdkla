
# Skip other image types to optimize build
IMAGE_FSTYPES_remove = "wic.xz"

# Update the list of DTB and DTBOs globally.
# This is to ensure that the recipe for ti-tisdk-makefile picks this for generating makefile
KERNEL_DEVICETREE_append = " \
	ti/k3-j721e-vision-apps.dtbo \
"

# Autoload the kernel module
KERNEL_MODULE_AUTOLOAD_EXTRAS = ""
KERNEL_MODULE_AUTOLOAD_EXTRAS_j7-evm += "rpmsg_kdrv_switch"
KERNEL_MODULE_AUTOLOAD += "${KERNEL_MODULE_AUTOLOAD_EXTRAS}"
