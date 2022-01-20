PR_append = ".tisdk0"

# Add small docker rootfs for all SOCs
TARGET_IMAGES_append = " tisdk-docker-rootfs-image tisdk-tiny-image"

# Generate the full target file system components table.
sw_manifest_target() {
    # Extract the combined set of .control files from the TARGET_IMAGES in
    # the filesystem directory to generate the manifest.
    for image in ${TARGET_IMAGES}
    do
        if [ $image == "tisdk-tiny-image" ];
        then
	    continue
        else
            # Only extract tar.gz or tar.bz2 types
           if [ -e ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.xz ]
           then
               tar xJf ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.xz -C ${IMAGE_ROOTFS}/filesystem --wildcards *.control
           elif [ -e ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.gz ]
           then
               tar xzf ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.gz -C ${IMAGE_ROOTFS}/filesystem --wildcards *.control
           fi
        fi
    done

    # set the opkg_dir value to look at the extracted target file system
    # image files
    opkg_dir="${IMAGE_ROOTFS}/filesystem/var/lib/opkg/info"

    sw_manifest_target_gplv3 $opkg_dir

    sw_manifest_table_header "All Target Device Content" "This table describes any software being delivered that is expected to run on the target device."

    generate_sw_manifest_table $opkg_dir

    sw_manifest_table_footer

    # Remove the temporary var directory that was extracted
    rm -rf ${IMAGE_ROOTFS}/filesystem/var
}

require tisdk-core-bundle-sw-manifest.inc
