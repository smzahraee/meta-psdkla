DESCRIPTION = "TensorFlow's lightweight solution for mobile and embedded devices"
AUTHOR = "Google Inc. and Yuan Tang"
HOMEPAGE = "https://www.tensorflow.org/lite"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://LICENSE;md5=64a34301f8e355f57ec992c2af3e5157"

S = "${WORKDIR}/git"
TF_DOWNLOADS = "tensorflow/lite/tools/make/downloads"
FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

PR = "psdkla"

SRC_URI = "git://github.com/tensorflow/tensorflow.git;branch=r2.4;rev=582c8d236cb079023657287c318ff26adb239002;protocol=https \
    https://gitlab.com/libeigen/eigen/-/archive/011e0db31d1bed8b7f73662be6d57d9f30fa457a/eigen-011e0db31d1bed8b7f73662be6d57d9f30fa457a.tar.gz;name=eigen;subdir=${S}/${TF_DOWNLOADS}/eigen \
    https://storage.googleapis.com/mirror.tensorflow.org/github.com/google/gemmlowp/archive/fda83bdc38b118cc6b56753bd540caa49e570745.zip;name=gemmlowp;subdir=${S}/${TF_DOWNLOADS}/gemmlowp \
    https://github.com/google/ruy/archive/5bb02fbf90824c2eb6cd7418f766c593106a332b.zip;name=ruy;subdir=${S}/${TF_DOWNLOADS}/ruy \
    https://github.com/google/googletest/archive/release-1.8.0.tar.gz;name=googletest;subdir=${S}/${TF_DOWNLOADS}/googletest \
    https://github.com/abseil/abseil-cpp/archive/df3ea785d8c30a9503321a3d35ee7d35808f190d.tar.gz;name=absl;subdir=${S}/${TF_DOWNLOADS}/absl \
    https://github.com/intel/ARM_NEON_2_x86_SSE/archive/2cbbc2a531bcb5734e051c46de47997b2e6b7a72.zip;name=neon_2_sse;subdir=${S}/${TF_DOWNLOADS}/neon_2_sse \
    https://storage.googleapis.com/mirror.tensorflow.org/github.com/google/farmhash/archive/816a4ae622e964763ca0862d9dbd19324a1eaf45.tar.gz;name=farmhash;subdir=${S}/${TF_DOWNLOADS}/farmhash \
    https://github.com/google/flatbuffers/archive/v1.12.0.tar.gz;name=flatbuffers;subdir=${S}/${TF_DOWNLOADS}/flatbuffers \
    https://storage.googleapis.com/mirror.tensorflow.org/www.kurims.kyoto-u.ac.jp/~ooura/fft2d.tgz;name=fft2d;subdir=${S}/${TF_DOWNLOADS}/fft2d \
    https://github.com/Maratyszcza/FP16/archive/febbb1c163726b5db24bed55cc9dc42529068997.zip;name=fp16;subdir=${S}/${TF_DOWNLOADS}/fp16 \
    https://github.com/pytorch/cpuinfo/archive/c2092219e7c874783a00a62edb94ddc672f57ab3.zip;name=cpuinfo;subdir=${S}/${TF_DOWNLOADS}/cpuinfo \
    http://download.tensorflow.org/models/mobilenet_v1_2018_08_02/mobilenet_v1_1.0_224_quant.tgz;name=mobilenet_v1_quant;subdir=${WORKDIR}/model;destsuffix=model \
    file://apply-modification-for-eigen.patch \
    file://apply-modification-for-setup-py.patch \
    file://tflite-benchmark.sh \
    file://tensorflow-lite.pc.in \
"

SRC_URI[eigen.sha256sum] = "e807a6a6f3a0e8ab10adeb59bb5a9bbb113e8e1684f9b4b32f73f58fd758b4cf"
SRC_URI[gemmlowp.sha256sum] = "43146e6f56cb5218a8caaab6b5d1601a083f1f31c06ff474a4378a7d35be9cfb"
SRC_URI[ruy.sha256sum] = "d8f9dc52c0a52c8470e2e0b60bc16cba91853d812846c075f7ed8404990b003d"
SRC_URI[googletest.sha256sum] = "58a6f4277ca2bc8565222b3bbd58a177609e9c488e8a72649359ba51450db7d8"
SRC_URI[absl.sha256sum] = "f368a8476f4e2e0eccf8a7318b98dafbe30b2600f4e3cf52636e5eb145aba06a"
SRC_URI[neon_2_sse.sha256sum] = "0359e65a0d815574a862941d0b106a66a8b8091038e32a669bb6ddd8d81cd57a"
SRC_URI[farmhash.sha256sum] = "6560547c63e4af82b0f202cb710ceabb3f21347a4b996db565a411da5b17aba0"
SRC_URI[flatbuffers.sha256sum] = "62f2223fb9181d1d6338451375628975775f7522185266cd5296571ac152bc45"
SRC_URI[fft2d.sha256sum] = "ada7e99087c4ed477bfdf11413f2ba8db8a840ba9bbf8ac94f4f3972e2a7cec9"
SRC_URI[fp16.sha256sum] = "9635d6245762714237d165e11f4359599eeb140ccc800bfe247948f167daabf6"
SRC_URI[cpuinfo.sha256sum] = "ea56c399a4f6ca5f749e71acb6a7bfdc653eb65d8f658cb2e414a2fcdca1fe8b"
SRC_URI[mobilenet_v1_quant.sha256sum] = "d32432d28673a936b2d6281ab0600c71cf7226dfe4cdcef3012555f691744166"

S = "${WORKDIR}/git"

do_cp_downloaded_build_deps() {
    mv ${S}/${TF_DOWNLOADS}/eigen/*/* ${S}/${TF_DOWNLOADS}/eigen
    mv ${S}/${TF_DOWNLOADS}/gemmlowp/*/* ${S}/${TF_DOWNLOADS}/gemmlowp
    mv ${S}/${TF_DOWNLOADS}/ruy/*/* ${S}/${TF_DOWNLOADS}/ruy
    mv ${S}/${TF_DOWNLOADS}/googletest/*/* ${S}/${TF_DOWNLOADS}/googletest
    mv ${S}/${TF_DOWNLOADS}/absl/*/* ${S}/${TF_DOWNLOADS}/absl
    mv ${S}/${TF_DOWNLOADS}/neon_2_sse/*/* ${S}/${TF_DOWNLOADS}/neon_2_sse
    mv ${S}/${TF_DOWNLOADS}/farmhash/*/* ${S}/${TF_DOWNLOADS}/farmhash
    mv ${S}/${TF_DOWNLOADS}/flatbuffers/*/* ${S}/${TF_DOWNLOADS}/flatbuffers
    mv ${S}/${TF_DOWNLOADS}/fft2d/*/* ${S}/${TF_DOWNLOADS}/fft2d
    mv ${S}/${TF_DOWNLOADS}/fp16/*/* ${S}/${TF_DOWNLOADS}/fp16
    mv ${S}/${TF_DOWNLOADS}/cpuinfo/*/* ${S}/${TF_DOWNLOADS}/cpuinfo
}
addtask do_cp_downloaded_build_deps after do_unpack before do_patch

inherit setuptools3 python3native deploy

# Set B so that DLR Python installation can find the library
B = "${S}"

do_compile() {
    oe_runmake -f tensorflow/lite/tools/make/Makefile
}

do_prepare_pip_package() {
    # prepare for tfLite_runtime python package build / installation
    mkdir -p ${S}/tensorflow/lite/tools/pip_package/gen/tflite_runtime
    cp -r ${S}/tensorflow/lite/tools/pip_package/setup.py ${S}/tensorflow/lite/tools/pip_package/gen
    cp -r ${S}/tensorflow/lite/tools/pip_package/MANIFEST.in ${S}/tensorflow/lite/tools/pip_package/gen
    cp -r ${S}/tensorflow/lite/python/interpreter_wrapper ${S}/tensorflow/lite/tools/pip_package/gen
    cp -r ${S}/tensorflow/lite/python/interpreter.py ${S}/tensorflow/lite/tools/pip_package/gen/tflite_runtime/
    echo "__version__ = '${PV}'" > ${S}/tensorflow/lite/tools/pip_package/gen/tflite_runtime/__init__.py
}

addtask do_prepare_pip_package after do_compile before do_install

tensorflow_lite_do_install() {

    # install library
    install -d ${D}${libdir}
    install -m 0644 ${S}/../../make/gen/${TARGET_OS}_${TUNE_ARCH}/lib/*.a ${D}${libdir}/

#    # install headers
#    ##install -d ${D}${includedir}/tensorflow/lite
#    ##install -m 0644 ${S}/tensorflow/lite/*.h ${D}${includedir}/tensorflow/lite/
#    ##install -d ${D}${includedir}/tensorflow/lite/c
#    ##install -m 0644 ${S}/tensorflow/lite/c/*.h ${D}${includedir}/tensorflow/lite/c/
#    ##install -d ${D}${includedir}/tensorflow/lite/core/
#    ##install -m 0644 ${S}/tensorflow/lite/core/*.h ${D}${includedir}/tensorflow/lite/core/
#    ##install -d ${D}${includedir}/tensorflow/lite/core/api/
#    ##install -m 0644 ${S}/tensorflow/lite/core/api/*.h ${D}${includedir}/tensorflow/lite/core/api/
#    ##install -d ${D}${includedir}/tensorflow/lite/kernels
#    ##install -m 0644 ${S}/tensorflow/lite/kernels/*.h ${D}${includedir}/tensorflow/lite/kernels/
#    ##install -d  ${D}${includedir}/tensorflow/lite/profiling/
#    ##install -m 0644 ${S}/tensorflow/lite/profiling/*.h ${D}${includedir}/tensorflow/lite/profiling/
#    ##install -d ${D}${includedir}/tensorflow/lite/schema/
#    ##install -m 0644 ${S}/tensorflow/lite/schema/*.h ${D}${includedir}/tensorflow/lite/schema/
#    ##install -m 0644 ${S}/tensorflow/lite/schema/schema.fbs ${D}${includedir}/tensorflow/lite/schema/
#    ##install -d ${D}${includedir}/tensorflow/lite/tools/
#    ##install -m 0644 ${S}/tensorflow/lite/tools/*.h ${D}${includedir}/tensorflow/lite/tools/
#    ##install -d ${D}${includedir}/tensorflow/lite/delegates/nnapi/
#    ##install -m 0644 ${S}/tensorflow/lite/delegates/nnapi/*.h ${D}${includedir}/tensorflow/lite/delegates/nnapi/
#    ##install -d ${D}${includedir}/tensorflow/lite/experimental/resource_variable/
#    ##install -m 0644 ${S}/tensorflow/lite/experimental/resource_variable/*.h ${D}${includedir}/tensorflow/lite/experimental/resource_variable/
#    ##install -d ${D}${includedir}/tensorflow/lite/kernels/internal/
#    ##install -m 0644 ${S}/tensorflow/lite/kernels/internal/*.h ${D}${includedir}/tensorflow/lite/kernels/internal/
#
#    # install pkgconfig
#    ##install -d ${D}${libdir}/pkgconfig
#    ##install -m 0644 ${WORKDIR}/tensorflow-lite.pc.in ${D}${libdir}/pkgconfig/tensorflow-lite.pc
#    ##sed -i 's:@version@:${PV}:g
#    ##    s:@libdir@:${libdir}:g
#    ##    s:@includedir@:${includedir}:g' ${D}${libdir}/pkgconfig/tensorflow-lite.pc
#
#    # install examples
#    ##install -d ${D}${datadir}/${BPN}/examples
#    ##install -m 0755 ${S}/tensorflow/lite/tools/make/gen/${TARGET_OS}_${TUNE_ARCH}/bin/minimal ${D}${datadir}/${BPN}/examples
#    ##install -m 0755 ${S}/tensorflow/lite/tools/make/gen/${TARGET_OS}_${TUNE_ARCH}/bin/benchmark_model ${D}${datadir}/${BPN}/examples
#    ##install -m 0755 ${S}/tensorflow/lite/tools/make/gen/${TARGET_OS}_${TUNE_ARCH}/bin/label_image ${D}${datadir}/${BPN}/examples
#    ##install -m 0644 ${S}/tensorflow/lite/examples/label_image/testdata/grace_hopper.bmp ${D}${datadir}/${BPN}/examples
#    ##install -m 0644 ${S}/tensorflow/lite/java/ovic/src/testdata/labels.txt ${D}${datadir}/${BPN}/examples
#    ##install -m 0644 ${WORKDIR}/model/mobilenet_v1_1.0_224_quant.tflite ${D}${datadir}/${BPN}/examples
#
#    # install benchmarking script
#    ##install -m 0755 ${WORKDIR}/tflite-benchmark.sh ${D}${datadir}/${BPN}/examples
#
    export PACKAGE_VERSION=${PV}
    export TENSORFLOW_DIR=${S}/../../../../..
    export LDFLAGS="${LDFLAGS} -L${S}/../../make/gen/${TARGET_OS}_${TUNE_ARCH}/lib "

    STAGING_LIBDIR="${STAGING_LIBDIR_NATIVE}" distutils3_do_install
}

python do_install() {
    d.setVar("S", "${WORKDIR}/git/tensorflow/lite/tools/pip_package/gen")
    temp = "${STAGING_LIBDIR}"
    d.setVar("STAGING_LIBDIR", "${STAGING_LIBDIR_NATIVE}")

    bb.build.exec_func("tensorflow_lite_do_install", d)

    d.setVar("STAGING_LIBDIR", temp)
    d.setVar("S", "${WORKDIR}/git")
}

DEPENDS = "zlib \
           python3-numpy-native \
           python3-pybind11-native \
"

EXTRA_OEMAKE = "\
    'CC=${CC}' \
    'CXX=${CXX}' \
    'EXTRA_CFLAGS=-I${STAGING_INCDIR}' \
    'EXTRA_CXXFLAGS=-I${STAGING_INCDIR}' \
    'AR=${AR}' \
    'LD=${LD}' \
    'TARGET=${TARGET_OS}' \
    'TARGET_ARCH=${TUNE_ARCH}' \
"

FILES_${PN} += "${libdir}/*.a \
"

FILES_${PN}-staticdev = ""

INSANE_SKIP_${PN} += "src-uri-bad \
                      staticdev \
"
BBCLASSEXTEND = "native nativesdk"

DEPENDS_append_class-native = "python3-wheel-native \
"
DEPENDS_append_class-target = "tensorflow-lite-native \
"

do_deploy () {
:
}

do_deploy_append_class-target() {
}

do_deploy_append_class-native() {
    # build the .whl package
    export PACKAGE_VERSION=${PV}
    export TENSORFLOW_DIR=${S}
    export LDFLAGS="${LDFLAGS} -L${S}/tensorflow/lite/tools/make/gen/${TARGET_OS}_${TUNE_ARCH}/lib "

    cd ${S}/tensorflow/lite/tools/pip_package/gen
    ${PYTHON} setup.py bdist_wheel --py-limited-api cp36

    # deploy the .whl package
    install -d ${DEPLOYDIR}
    install -m 644 ${WORKDIR}/git/tensorflow/lite/tools/pip_package/gen/dist/tflite_runtime-2.4.0-cp36-abi3-linux_x86_64.whl ${DEPLOYDIR}/tflite_runtime-2.4.0-cp36-abi3-linux_x86_64.whl
}

addtask deploy after do_prepare_pip_package before do_install
