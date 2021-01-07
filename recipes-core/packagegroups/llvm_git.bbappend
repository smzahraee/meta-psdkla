do_install_append_class-native() {
	install -d ${D}${libdir}/${LLVM_DIR}
	cp -r ${B}/lib/*.a ${D}${libdir}/${LLVM_DIR}

	install -d ${D}${includedir}/${LLVM_DIR}
	cp -r ${S}/include/* ${D}${includedir}/${LLVM_DIR}/

	cp -r ${B}/include/llvm/IR/*.inc ${D}${includedir}/${LLVM_DIR}/llvm/IR/
	cp -r ${B}/include/llvm/Config/*.h ${D}${includedir}/${LLVM_DIR}/llvm/Config/
	cp -r ${B}/include/llvm/Config/*.def ${D}${includedir}/${LLVM_DIR}/llvm/Config/
}

PR_append = "_psdkla"
