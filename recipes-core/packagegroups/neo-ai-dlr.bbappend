FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

BRANCH = "main"

# We need to use texasinstruments/tvm, so remove the URI and its submodules ...
SRC_URI_remove += "git://github.com/neo-ai/tvm;protocol=https;branch=release-1.4.0;destsuffix=${S}/3rdparty/tvm;name=neo-ai-tvm \
                   git://github.com/dmlc/dmlc-core;protocol=https;branch=master;destsuffix=${S}/3rdparty/tvm/3rdparty/dmlc-core;name=neo-ai-tvm-dmlc-core \
                   git://github.com/dmlc/dlpack;protocol=https;branch=master;destsuffix=${S}/3rdparty/tvm/3rdparty/dlpack;name=neo-ai-tvm-dlpack \
"

# ... and add the new URI and add the submodules, again. Note -ti suffixes to make distinct entries
SRC_URI_append += " \
        file://0001-DLR-fix-typo-input-vs-output.patch \
        file://0001-upstream-add-condition-for-TIDL.patch \
        file://0001-not-upstream-yocto-run-without-REST.patch \
        file://0001-maybe-upstream-add-a-method-to-get-custom-data.patch \
        git://github.com/texasinstruments/tvm;protocol=https;branch=tidl-j7;destsuffix=${S}/3rdparty/tvm;name=neo-ai-tvm-ti \
        git://github.com/dmlc/dmlc-core;protocol=https;branch=master;destsuffix=${S}/3rdparty/tvm/3rdparty/dmlc-core;name=neo-ai-tvm-dmlc-core-ti \
        git://github.com/dmlc/dlpack;protocol=https;branch=master;destsuffix=${S}/3rdparty/tvm/3rdparty/dlpack;name=neo-ai-tvm-dlpack-ti \
        file://inc \
"
# file://inc is a stopgap, it will come as TIDL header package

# Redefine SRCREVs but with -ti suffix; no need to append to LIC_FILES_CHKSUM, these files should be identical
SRCREV_neo-ai-tvm-ti = "c57a239ce21f5c7c7fde92147a1295ddaa268d88"
SRCREV_neo-ai-tvm-dmlc-core-ti = "6c401e242c59a1f4c913918246591bb13fd714e7"
SRCREV_neo-ai-tvm-dlpack-ti = "3ec04430e89a6834e5a1b99471f415fa939bf642"

# once file://inc is resolved, fix USE_TIDL_RT_PATH
EXTRA_OECMAKE += "-DUSE_TIDL=ON -DUSE_TIDL_RT_PATH=${S}/.. "

DISTUTILS_SETUP_PATH = "${S}/python"

do_install() {
    # This does not do anything
    #cmake_do_install

    install -d ${D}${includedir}/dlr_tflite
    install -m 0644 ${S}/include/*.h ${D}${includedir}
    install -m 0644 ${S}/include/dlr_tflite/*.h ${D}${includedir}/dlr_tflite

    # Install DLR Python binding
    distutils3_do_install

    # setup.py install some libs under datadir, but we don't need them, so remove.
    rm ${D}${datadir}/dlr/*.so

    # Install DLR library to Python import search path
    install -m 0644 ${S}/build/lib/libdlr.so ${D}${PYTHON_SITEPACKAGES_DIR}/dlr

    # Now install python test scripts
    install -d ${D}${datadir}/dlr/tests/python/integration
    install -m 0644 ${S}/tests/python/integration/*.py ${D}${datadir}/dlr/tests/python/integration
    install -m 0644 ${S}/tests/python/integration/*.npy ${D}${datadir}/dlr/tests/python/integration
}

PR_append = "_psdkla"

BBCLASSEXTEND = "native nativesdk"

DEPENDS_append_class-native += "python3-wheel"

inherit deploy

do_deploy () {
:
}

do_deploy_append_class-target() {
}

do_deploy_append_class-native() {
    # build the .whl package
    cd ${S}/python
    ${PYTHON} setup.py bdist_wheel

    # deploy the .whl package
    install -d ${DEPLOYDIR}
    install -m 644 ${WORKDIR}/git/python/dist/dlr-1.4.0-py3-none-any.whl ${DEPLOYDIR}/dlr-1.4.0-py3-none-any.whl
}

addtask deploy before do_build after do_compile
