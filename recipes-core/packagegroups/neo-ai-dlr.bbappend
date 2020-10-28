FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

# We need to use texasinstruments/tvm, so remove the URI and its submodules ...
SRC_URI_remove += "git://github.com/neo-ai/tvm;protocol=https;branch=release-1.4.0;destsuffix=${S}/3rdparty/tvm;name=neo-ai-tvm \
                   git://github.com/dmlc/dmlc-core;protocol=https;branch=master;destsuffix=${S}/3rdparty/tvm/3rdparty/dmlc-core;name=neo-ai-tvm-dmlc-core \
                   git://github.com/dmlc/dlpack;protocol=https;branch=master;destsuffix=${S}/3rdparty/tvm/3rdparty/dlpack;name=neo-ai-tvm-dlpack \
"

# ... and add the new URI and add the submodules, again. Note -ti suffixes to make distinct entries
SRC_URI_append += " \
        file://0001-patch-test-utils.patch \
        file://0001-upstream-add-condition-for-TIDL.patch \
        file://0001-not-upstream-yocto-run-without-REST.patch \
        git://github.com/texasinstruments/tvm;protocol=https;branch=tidl-j7;destsuffix=${S}/3rdparty/tvm;name=neo-ai-tvm-ti \
        git://github.com/dmlc/dmlc-core;protocol=https;branch=master;destsuffix=${S}/3rdparty/tvm/3rdparty/dmlc-core;name=neo-ai-tvm-dmlc-core-ti \
        git://github.com/dmlc/dlpack;protocol=https;branch=master;destsuffix=${S}/3rdparty/tvm/3rdparty/dlpack;name=neo-ai-tvm-dlpack-ti \
        file://inc \
"
# file://inc is a stopgap, it will come as TIDL header package

# Redefine SRCREVs but with -ti suffix; no need to append to LIC_FILES_CHKSUM, these files should be identical
SRCREV_neo-ai-tvm-ti = "34da9ad47035ac72cfc006d3c60d224465a8df1a"
SRCREV_neo-ai-tvm-dmlc-core-ti = "6c401e242c59a1f4c913918246591bb13fd714e7"
SRCREV_neo-ai-tvm-dlpack-ti = "3ec04430e89a6834e5a1b99471f415fa939bf642"

# once file://inc is resolved, fix USE_TIDL_RT_PATH
EXTRA_OECMAKE += "-DUSE_TIDL=ON -DUSE_TIDL_RT_PATH=${S}/.. "

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
