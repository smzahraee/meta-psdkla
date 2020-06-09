FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"


SRC_URI_append += " \
        file://0001-patch-test-utils.patch \
"

neo_ai_dlr_do_install() {
    # This does not do anything
    #cmake_do_install

    install -d ${D}${includedir}/dlr_tflite
    install -m 0644 ${S}/../include/*.h ${D}${includedir}
    install -m 0644 ${S}/../include/dlr_tflite/*.h ${D}${includedir}/dlr_tflite

    # Install DLR Python binding
    cd ${S}/../python
    distutils3_do_install

    # setup.py install some libs under datadir, but we don't need them, so remove.
    rm ${D}${datadir}/dlr/*.so

    # Install DLR library to Python import search path
    install -m 0644 ${S}/../build/lib/libdlr.so ${D}${PYTHON_SITEPACKAGES_DIR}/dlr

    # Now install python test scripts
    install -d ${D}${datadir}/dlr/tests/python/integration
    install -m 0644 ${S}/../tests/python/integration/*.py ${D}${datadir}/dlr/tests/python/integration
    install -m 0644 ${S}/../tests/python/integration/*.npy ${D}${datadir}/dlr/tests/python/integration
}

python do_install() {
    d.setVar("S", "${WORKDIR}/git/python")
    bb.build.exec_func("neo_ai_dlr_do_install", d)
    d.setVar("S", "${WORKDIR}/git")
}
