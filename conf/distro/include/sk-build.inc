
# Sets variables for SK device types for supported SOCs

# For AM68-SK, default tiboot3.bin should be HSFS
IMAGE_BOOT_FILES:remove:j721s2-evm = "tiboot3.bin"
IMAGE_BOOT_FILES:append:j721s2-evm = " tiboot3-j721s2-hs-fs-evm.bin;tiboot3.bin"

# For AM69-SK, default tiboot3.bin should be HSFS
IMAGE_BOOT_FILES:remove:j784s4-evm = "tiboot3.bin"
IMAGE_BOOT_FILES:append:j784s4-evm = " tiboot3-j784s4-hs-fs-evm.bin;tiboot3.bin"

