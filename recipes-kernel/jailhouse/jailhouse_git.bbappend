do_install() {
	oe_runmake ARCH=${JH_ARCH} CROSS_COMPILE=${TARGET_PREFIX} KDIR=${STAGING_KERNEL_BUILDDIR} DESTDIR=${D} install

	install -d ${D}${CELL_DIR}
	install -m 0644 ${B}/configs/${JH_ARCH}/${JH_CELL_FILES} ${D}${CELL_DIR}/

	install -d ${D}${INMATES_DIR}
	install -m 0644 ${B}/inmates/demos/${JH_ARCH}/*.bin ${D}${INMATES_DIR}

	install -d ${D}/boot

	if [ -n "${JH_INMATE_DTB}" -a -n "${JH_LINUX_DEMO_CELL}" ]; then
		cd ${TOOLS_SRC_DIR}

		echo "#! /bin/sh" > ${D}${JH_DATADIR}/linux-demo.sh
		echo "jailhouse enable ${CELL_DIR}/${JH_SYSCONFIG_CELL}" >> ${D}${JH_DATADIR}/linux-demo.sh
		echo "" >> ${D}${JH_DATADIR}/linux-demo.sh
		echo "# Wait for jailhouse to be ready" >> ${D}${JH_DATADIR}/linux-demo.sh
		echo "sleep 5" >> ${D}${JH_DATADIR}/linux-demo.sh
		echo "" >> ${D}${JH_DATADIR}/linux-demo.sh
		echo "# Launch uart-demo inmate to ready console for linux inmate" >> ${D}${JH_DATADIR}/linux-demo.sh
		echo "# and destroy it after it runs for 5 seconds" >> ${D}${JH_DATADIR}/linux-demo.sh
		echo "jailhouse cell create ${CELL_DIR}/k3-j721e-evm-uart-demo.cell" >> ${D}${JH_DATADIR}/linux-demo.sh
		echo "jailhouse cell load uart-demo ${INMATES_DIR}/uart-demo.bin" >> ${D}${JH_DATADIR}/linux-demo.sh
		echo "jailhouse cell start uart-demo" >> ${D}${JH_DATADIR}/linux-demo.sh
		echo "sleep 5" >> ${D}${JH_DATADIR}/linux-demo.sh
		echo "jailhouse cell destroy uart-demo" >> ${D}${JH_DATADIR}/linux-demo.sh
		echo "" >> ${D}${JH_DATADIR}/linux-demo.sh
		echo "# Launch linux inmate" >> ${D}${JH_DATADIR}/linux-demo.sh
		./jailhouse-cell-linux -w ${D}${JH_DATADIR}/${JH_INMATE_DTB} \
			-a ${JH_ARCH} -c "${JH_CMDLINE}" \
			-d ../configs/${JH_ARCH}/dts/${JH_INMATE_DTB} \
			${D}${CELL_DIR}/${JH_LINUX_DEMO_CELL} \
			${DEPLOY_DIR_IMAGE}/Image \
			| tr -cd '\11\12\15\40-\176' \
			> ${D}${JH_DATADIR}/linux-demo-staging.sh

		sed -i -e 's,^Modified device tree written.*,,g' ${D}${JH_DATADIR}/linux-demo-staging.sh
		sed -i -e 's,\${D},,g' ${D}${JH_DATADIR}/linux-demo-staging.sh
		sed -i -e 's, linux-loader.bin, ${JH_EXEC_DIR}/linux-loader.bin,g' ${D}${JH_DATADIR}/linux-demo-staging.sh
		sed -i -e 's,\${DEPLOY_DIR_IMAGE},/boot,g' ${D}${JH_DATADIR}/linux-demo-staging.sh
		sed -i -e '/^\s*$/d' ${D}${JH_DATADIR}/linux-demo-staging.sh
		cat ${D}${JH_DATADIR}/linux-demo-staging.sh >> ${D}${JH_DATADIR}/linux-demo.sh
		rm ${D}${JH_DATADIR}/linux-demo-staging.sh
		chmod +x ${D}${JH_DATADIR}/linux-demo.sh
	fi
}

PR_append = "_psdkla"
