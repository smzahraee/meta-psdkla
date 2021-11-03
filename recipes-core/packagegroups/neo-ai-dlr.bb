SUMMARY = "NEO-AI Deep Learning Runtime"
DESCRIPTION = "Neo-AI-DLR is a common runtime for machine learning models compiled by AWS SageMaker Neo, TVM, or TreeLite."
HOMEPAGE = "https://aws.amazon.com/sagemaker/neo/"
LICENSE = "Apache-2.0 & BSD-3-Clause"

LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658 \
                    file://3rdparty/tvm/LICENSE;md5=e313a9b6eda820e35716d9529001537f \
                    file://3rdparty/tvm/3rdparty/vta-hw/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e \
                    file://3rdparty/tvm/3rdparty/dmlc-core/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e \
                    file://3rdparty/tvm/3rdparty/rang/LICENSE;md5=911690f51af322440237a253d695d19f \
                    file://3rdparty/tvm/3rdparty/dlpack/LICENSE;md5=f62d4e85ba68a1574b74d97ab8dea9ab \
                    file://3rdparty/dlfcn-win32/COPYING;md5=64b8b80fb4b723a1a37aaae9a3f17df9 \
                    file://3rdparty/treelite/LICENSE;md5=34400b68072d710fecd0a2940a0d1658 \
                    file://3rdparty/treelite/dmlc-core/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e \
                    file://3rdparty/treelite/3rdparty/protobuf/LICENSE;md5=35953c752efc9299b184f91bef540095 \
                    file://3rdparty/treelite/3rdparty/protobuf/third_party/benchmark/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57 \
                    file://3rdparty/treelite/3rdparty/fmt/LICENSE.rst;md5=c2e38bc8629eac247a73b65c1548b2f0 \
"

# Main DLR sources plus submodules (and submodules of submodules).
SRC_URI = "git://github.com/texasinstruments/neo-ai-dlr;protocol=https;branch=tidl-j7;name=base \
           git://github.com/texasinstruments/tvm;protocol=https;branch=tidl-j7;destsuffix=${S}/3rdparty/tvm;name=3rdparty-tvm \
           git://github.com/apache/incubator-tvm-vta;protocol=https;branch=main;destsuffix=${S}/3rdparty/tvm/3rdparty/vta-hw;name=3rdparty-tvm-3rdparty-vta-hw \
           git://github.com/dmlc/dmlc-core;protocol=https;branch=main;destsuffix=${S}/3rdparty/tvm/3rdparty/dmlc-core;name=3rdparty-tvm-3rdparty-dmlc-core \
           git://github.com/agauniyal/rang;protocol=https;branch=master;destsuffix=${S}/3rdparty/tvm/3rdparty/rang;name=3rdparty-tvm-3rdparty-rang \
           git://github.com/dmlc/dlpack;protocol=https;branch=main;destsuffix=${S}/3rdparty/tvm/3rdparty/dlpack;name=3rdparty-tvm-3rdparty-dlpack \
           git://github.com/dlfcn-win32/dlfcn-win32;protocol=https;branch=master;destsuffix=${S}/3rdparty/dlfcn-win32;name=3rdparty-dlfcn-win32 \
           git://github.com/neo-ai/treelite;protocol=https;branch=release-1.3.0;destsuffix=${S}/3rdparty/treelite;name=3rdparty-treelite \
           git://github.com/dmlc/dmlc-core;protocol=https;branch=main;destsuffix=${S}/3rdparty/treelite/dmlc-core;name=3rdparty-treelite-dmlc-core \
           git://github.com/google/protobuf;protocol=https;branch=master;destsuffix=${S}/3rdparty/treelite/3rdparty/protobuf;name=3rdparty-treelite-3rdparty-protobuf \
           git://github.com/google/benchmark;protocol=https;branch=master;destsuffix=${S}/3rdparty/treelite/3rdparty/protobuf/third_party/benchmark;name=3rdparty-treelite-3rdparty-protobuf-third-party-benchmark \
           git://github.com/fmtlib/fmt;protocol=https;nobranch=1;destsuffix=${S}/3rdparty/treelite/3rdparty/fmt;name=3rdparty-treelite-3rdparty-fmt \
           git://github.com/llohse/libnpy;protocol=https;branch=master;destsuffix=${S}/3rdparty/libnpy;name=3rdparty-libnpy \
           file://inc \
"

SRCREV_base = "0b9f538e31995f0a7c14afbdd73a33eed03b3ff0"
SRCREV_3rdparty-tvm = "2a9cf9fb08cd1e102cb0c7d4baff318cbbdb3b64"
SRCREV_3rdparty-tvm-3rdparty-vta-hw = "57db5a718c74a788c98120ebbe1230797be698c8"
SRCREV_3rdparty-tvm-3rdparty-dmlc-core = "6c401e242c59a1f4c913918246591bb13fd714e7"
SRCREV_3rdparty-tvm-3rdparty-rang = "cabe04d6d6b05356fa8f9741704924788f0dd762"
SRCREV_3rdparty-tvm-3rdparty-dlpack = "3ec04430e89a6834e5a1b99471f415fa939bf642"
SRCREV_3rdparty-dlfcn-win32 = "008df693cf5a71b8f1db87731a7b5af87400e5dd"
SRCREV_3rdparty-treelite = "38964865d624048d1a432af2763ee1dcdbe3ce5d"
SRCREV_3rdparty-treelite-dmlc-core = "6c401e242c59a1f4c913918246591bb13fd714e7"
SRCREV_3rdparty-treelite-3rdparty-protobuf = "106ffc04be1abf3ff3399f54ccf149815b287dd9"
SRCREV_3rdparty-treelite-3rdparty-protobuf-third-party-benchmark = "360e66c1c4777c99402cf8cd535aa510fee16573"
SRCREV_3rdparty-treelite-3rdparty-fmt = "135ab5cf71ed731fc9fa0653051e7d4884a3652f"
SRCREV_3rdparty-libnpy = "641f2a581357a51c0973889f031ad88db28de31a"

S = "${WORKDIR}/git"

inherit setuptools3 cmake python3native

# Set B so that DLR Python installation can find the library
B = "${S}/build"

EXTRA_OECMAKE = "-DUSE_TESTS=OFF "

PACKAGES =+ "${PN}-tests"
FILES_${PN}-tests = "${datadir}/dlr/tests"
RDEPENDS_${PN}-tests += "${PN}"

# Versioned libs are not produced
FILES_SOLIBSDEV = ""

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

# once file://inc is resolved, fix USE_TIDL_RT_PATH
EXTRA_OECMAKE += "-DUSE_TIDL=ON -DUSE_TIDL_RT_PATH=${S}/.. "

DISTUTILS_SETUP_PATH = "${S}/python"

do_install() {
    # This does not do anything
    #cmake_do_install

    install -d ${D}${includedir}/dlr_hexagon
    install -m 0644 ${S}/include/*.h ${D}${includedir}
    install -m 0644 ${S}/include/dlr_hexagon/*.h ${D}${includedir}/dlr_hexagon

    # Install DLR Python binding
    distutils3_do_install

    # setup.py install some libs under datadir, but we don't need them, so remove.
    rm ${D}${datadir}/dlr/*.so

    # Install DLR library to Python import search path
    install -m 0644 ${S}/build/lib/libdlr.so ${D}${PYTHON_SITEPACKAGES_DIR}/dlr
}

PV = "1.8.0"
PR = "r2"
PR_append = "_psdkla"
