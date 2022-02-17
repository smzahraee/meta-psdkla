DESCRIPTION = "ONNX Runtime is an open-source scoring engine for Open Neural \
Network Exchange (ONNX) models. ONNX Runtime has an open architecture that \
is continually evolving to address the newest developments and challenges \
in AI and Deep Learning."
SUMMARY = "ONNX Runtime"
HOMEPAGE = "https://github.com/microsoft/onnxruntime"
LICENSE = "MIT"

S = "${WORKDIR}/git"

PV = "1.7.0"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

LIC_FILES_CHKSUM = "file://LICENSE;md5=0f7e3b1308cb5c00b372a6e78835732d \
                    file://server/external/spdlog/LICENSE;md5=6e5242b8f24d08c5e948675102937cc9 \
                    file://cmake/external/coremltools/LICENSE.txt;md5=cabfb917a2321dcea58514a0f4c4db3b \
                    file://cmake/external/tvm/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e \
                    file://cmake/external/tvm/3rdparty/dlpack/LICENSE;md5=f62d4e85ba68a1574b74d97ab8dea9ab \
                    file://cmake/external/tvm/3rdparty/rang/LICENSE;md5=911690f51af322440237a253d695d19f \
                    file://cmake/external/tvm/3rdparty/dmlc-core/LICENSE;md5=0ca7d6e8f4af26868cb42025ad83374b \
                    file://cmake/external/tvm/3rdparty/HalideIR/LICENSE;md5=9910386e68f0616e1ecf1037479fa97e \
                    file://cmake/external/googletest/LICENSE;md5=cbbd27594afd089daa160d3a16dd515a \
                    \
                    file://cmake/external/libprotobuf-mutator/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57 \
                    file://cmake/external/mimalloc/LICENSE;md5=a88b9521ac8b519ef8f0577b1d08541d \
                    file://cmake/external/eigen/COPYING.GPL;md5=d32239bcb673463ab874e80d47fae504 \
                    file://cmake/external/tensorboard/LICENSE;md5=e74df23890b9521cc481e3348863e45d \
                    file://cmake/external/date/LICENSE.txt;md5=b5d973344b3c7bbf7535f0e6e002d017 \
                    file://cmake/external/flatbuffers/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57 \
                    file://cmake/external/onnx-tensorrt/LICENSE;md5=00069fe86c3c2f8f427b7b042f0eb4fb \
                    file://cmake/external/onnx-tensorrt/third_party/onnx/LICENSE;md5=efff5c5110f124a1e2163814067b16e7 \
                    file://cmake/external/onnx-tensorrt/third_party/onnx/third_party/benchmark/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57 \
                    file://cmake/external/onnx-tensorrt/third_party/onnx/third_party/pybind11/LICENSE;md5=beb87117af69fd10fbf9fb14c22a2e62 \
                    file://cmake/external/onnx-tensorrt/third_party/onnx/third_party/pybind11/tools/clang/LICENSE.TXT;md5=dfabea443c6c16b6321441a8c8c19705 \
                    file://cmake/external/re2/LICENSE;md5=3b5c31eb512bdf3cb11ffd5713963760 \
                    file://cmake/external/onnx/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57 \
                    file://cmake/external/onnx/third_party/benchmark/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57 \
                    file://cmake/external/onnx/third_party/pybind11/LICENSE;md5=774f65abd8a7fe3124be2cdf766cd06f \
                    file://cmake/external/optional-lite/LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c \
                    file://cmake/external/wil/LICENSE;md5=b98fddd052bb2f5ddbcdbd417ffb26a8 \
                    file://cmake/external/cub/LICENSE.TXT;md5=20d1414b801e2a130d7d546685105508 \
                    file://cmake/external/nsync/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57 \
                    file://cmake/external/protobuf/LICENSE;md5=37b5762e07f0af8c74ce80a8bda4266b \
                    file://cmake/external/protobuf/third_party/googletest/LICENSE;md5=cbbd27594afd089daa160d3a16dd515a \
                    file://cmake/external/protobuf/third_party/benchmark/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57 \
                    file://cmake/external/cxxopts/LICENSE;md5=8de00431559a76a1b43f6fd44f8f6689 \
                    file://cmake/external/json/LICENSE.MIT;md5=f5f7c71504da070bcf4f090205ce1080 \
                    file://cmake/external/SafeInt/safeint/LICENSE;md5=052fd523d0ea51ed2fb75a46627e23bf \
                    file://cmake/external/FeaturizersLibrary/LICENSE;md5=e74f78882cab57fd1cc4c5482b9a214a \
                    file://cmake/external/FeaturizersLibrary/src/3rdParty/eigen/COPYING.GPL;md5=d32239bcb673463ab874e80d47fae504 \
                    file://cmake/external/FeaturizersLibrary/src/3rdParty/re2/LICENSE;md5=3b5c31eb512bdf3cb11ffd5713963760 \
"

SRC_URI = "git://github.com/TexasInstruments/onnxruntime;protocol=https;branch=tidl-j7;name=base \
           git://github.com/gabime/spdlog;protocol=https;branch=v2.x;destsuffix=${S}/server/external/spdlog;name=server-external-spdlog \
           git://github.com/apple/coremltools;protocol=https;branch=main;destsuffix=${S}/cmake/external/coremltools;name=cmake-external-coremltools \
           git://github.com/microsoft/onnxruntime-tvm;protocol=https;branch=nuphar;destsuffix=${S}/cmake/external/tvm;name=cmake-external-tvm \
           git://github.com/dmlc/dlpack;protocol=https;branch=main;destsuffix=${S}/cmake/external/tvm/3rdparty/dlpack;name=cmake-external-tvm-3rdparty-dlpack \
           git://github.com/agauniyal/rang;protocol=https;branch=master;destsuffix=${S}/cmake/external/tvm/3rdparty/rang;name=cmake-external-tvm-3rdparty-rang \
           git://github.com/dmlc/dmlc-core;protocol=https;branch=main;destsuffix=${S}/cmake/external/tvm/3rdparty/dmlc-core;name=cmake-external-tvm-3rdparty-dmlc-core \
           git://github.com/dmlc/HalideIR;protocol=https;branch=main;destsuffix=${S}/cmake/external/tvm/3rdparty/HalideIR;name=cmake-external-tvm-3rdparty-HalideIR \
           git://github.com/google/googletest;protocol=https;branch=master;destsuffix=${S}/cmake/external/googletest;name=cmake-external-googletest \
           git://github.com/boostorg/mp11;protocol=https;branch=master;destsuffix=${S}/cmake/external/mp11;name=cmake-external-mp11 \
           git://github.com/google/libprotobuf-mutator;protocol=https;branch=master;destsuffix=${S}/cmake/external/libprotobuf-mutator;name=cmake-external-libprotobuf-mutator \
           git://github.com/microsoft/mimalloc;protocol=https;branch=master;destsuffix=${S}/cmake/external/mimalloc;name=cmake-external-mimalloc \
           git://gitlab.com/libeigen/eigen;protocol=https;branch=master;destsuffix=${S}/cmake/external/eigen;name=cmake-external-eigen \
           git://github.com/tensorflow/tensorboard;protocol=https;branch=master;destsuffix=${S}/cmake/external/tensorboard;name=cmake-external-tensorboard \
           git://github.com/HowardHinnant/date;protocol=https;branch=master;destsuffix=${S}/cmake/external/date;name=cmake-external-date \
           git://github.com/google/flatbuffers;protocol=https;branch=master;destsuffix=${S}/cmake/external/flatbuffers;name=cmake-external-flatbuffers \
           git://github.com/onnx/onnx-tensorrt;protocol=https;branch=master;destsuffix=${S}/cmake/external/onnx-tensorrt;name=cmake-external-onnx-tensorrt \
           git://github.com/onnx/onnx;protocol=https;branch=rel-1.6.1;destsuffix=${S}/cmake/external/onnx-tensorrt/third_party/onnx;name=cmake-external-onnx-tensorrt-third-party-onnx \
           git://github.com/google/benchmark;protocol=https;branch=master;destsuffix=${S}/cmake/external/onnx-tensorrt/third_party/onnx/third_party/benchmark;name=cmake-external-onnx-tensorrt-third-party-onnx-third-party-benchmark \
           git://github.com/pybind/pybind11;protocol=https;branch=master;destsuffix=${S}/cmake/external/onnx-tensorrt/third_party/onnx/third_party/pybind11;name=cmake-external-onnx-tensorrt-third-party-onnx-third-party-pybind11 \
           git://github.com/wjakob/clang-cindex-python3;protocol=https;branch=master;destsuffix=${S}/cmake/external/onnx-tensorrt/third_party/onnx/third_party/pybind11/tools/clang;name=cmake-external-onnx-tensorrt-third-party-onnx-third-party-pybind11-tools-clang \
           git://github.com/google/re2;protocol=https;branch=main;destsuffix=${S}/cmake/external/re2;name=cmake-external-re2 \
           git://github.com/onnx/onnx;protocol=https;branch=main;destsuffix=${S}/cmake/external/onnx;name=cmake-external-onnx \
           git://github.com/google/benchmark;protocol=https;branch=master;destsuffix=${S}/cmake/external/onnx/third_party/benchmark;name=cmake-external-onnx-third-party-benchmark \
           git://github.com/pybind/pybind11;protocol=https;branch=master;destsuffix=${S}/cmake/external/onnx/third_party/pybind11;name=cmake-external-onnx-third-party-pybind11 \
           git://github.com/martinmoene/optional-lite;protocol=https;branch=master;destsuffix=${S}/cmake/external/optional-lite;name=cmake-external-optional-lite \
           git://github.com/microsoft/wil;protocol=https;branch=master;destsuffix=${S}/cmake/external/wil;name=cmake-external-wil \
           git://github.com/NVlabs/cub;protocol=https;branch=main;destsuffix=${S}/cmake/external/cub;name=cmake-external-cub \
           git://github.com/google/nsync;protocol=https;branch=master;destsuffix=${S}/cmake/external/nsync;name=cmake-external-nsync \
           git://github.com/protocolbuffers/protobuf;protocol=https;branch=master;destsuffix=${S}/cmake/external/protobuf;name=cmake-external-protobuf \
           git://github.com/google/googletest;protocol=https;branch=master;destsuffix=${S}/cmake/external/protobuf/third_party/googletest;name=cmake-external-protobuf-third-party-googletest \
           git://github.com/google/benchmark;protocol=https;branch=master;destsuffix=${S}/cmake/external/protobuf/third_party/benchmark;name=cmake-external-protobuf-third-party-benchmark \
           git://github.com/jarro2783/cxxopts;protocol=https;branch=master;destsuffix=${S}/cmake/external/cxxopts;name=cmake-external-cxxopts \
           git://github.com/nlohmann/json;protocol=https;branch=master;destsuffix=${S}/cmake/external/json;name=cmake-external-json \
           git://github.com/dcleblanc/SafeInt;protocol=https;branch=master;destsuffix=${S}/cmake/external/SafeInt/safeint;name=cmake-external-SafeInt-safeint \
           git://github.com/microsoft/FeaturizersLibrary;protocol=https;branch=master;destsuffix=${S}/cmake/external/FeaturizersLibrary;name=cmake-external-FeaturizersLibrary \
           git://gitlab.com/libeigen/eigen;protocol=https;branch=master;destsuffix=${S}/cmake/external/FeaturizersLibrary/src/3rdParty/eigen;name=cmake-external-FeaturizersLibrary-src-3rdParty-eigen \
           git://github.com/google/re2;protocol=https;branch=main;destsuffix=${S}/cmake/external/FeaturizersLibrary/src/3rdParty/re2;name=cmake-external-FeaturizersLibrary-src-3rdParty-re2 \
"

SRCREV_base = "22908b8d8466f2b44dbe8c9dce3211fb13f225f4"
SRCREV_server-external-spdlog = "352281313fe1c4313bc222cb9de222afd50c822f"
SRCREV_cmake-external-coremltools = "523d5e03d86c26267ee6bdf17dd20f6ce6bdadd7"
SRCREV_cmake-external-tvm = "eab844a87298d500f1924f8a7cadb4cbee426093"
SRCREV_cmake-external-tvm-3rdparty-dlpack = "5c792cef3aee54ad8b7000111c9dc1797f327b59"
SRCREV_cmake-external-tvm-3rdparty-rang = "cabe04d6d6b05356fa8f9741704924788f0dd762"
SRCREV_cmake-external-tvm-3rdparty-dmlc-core = "d07fb7a443b5db8a89d65a15a024af6a425615a5"
SRCREV_cmake-external-tvm-3rdparty-HalideIR = "b257a9221ee1e5180d994b3488ddcc259b0ac157"
SRCREV_cmake-external-googletest = "703bd9caab50b139428cea1aaff9974ebee5742e"
SRCREV_cmake-external-mp11 = "21cace4e574180ba64d9307a5e4ea9e5e94d3e8d"
SRCREV_cmake-external-libprotobuf-mutator = "7a2ed51a6b682a83e345ff49fc4cfd7ca47550db"
SRCREV_cmake-external-mimalloc = "2d54553b7a78c7c35620b827e7e5ab2228ecb495"
SRCREV_cmake-external-eigen = "d10b27fe37736d2944630ecd7557cefa95cf87c9"
SRCREV_cmake-external-tensorboard = "373eb09e4c5d2b3cc2493f0949dc4be6b6a45e81"
SRCREV_cmake-external-date = "e7e1482087f58913b80a20b04d5c58d9d6d90155"
SRCREV_cmake-external-flatbuffers = "6df40a2471737b27271bdd9b900ab5f3aec746c7"
SRCREV_cmake-external-onnx-tensorrt = "dc22bb323ece3c65419717be8a0d3d0f318a61fa"
SRCREV_cmake-external-onnx-tensorrt-third-party-onnx = "553df22c67bee5f0fe6599cff60f1afc6748c635"
SRCREV_cmake-external-onnx-tensorrt-third-party-onnx-third-party-benchmark = "e776aa0275e293707b6a0901e0e8d8a8a3679508"
SRCREV_cmake-external-onnx-tensorrt-third-party-onnx-third-party-pybind11 = "09f082940113661256310e3f4811aa7261a9fa05"
SRCREV_cmake-external-onnx-tensorrt-third-party-onnx-third-party-pybind11-tools-clang = "6a00cbc4a9b8e68b71caf7f774b3f9c753ae84d5"
SRCREV_cmake-external-re2 = "30cad267151fa8f1b17da8c1ef0571da6da9a8f1"
SRCREV_cmake-external-onnx = "237926eab41de21fb9addc4b03b751fd6a3343ec"
SRCREV_cmake-external-onnx-third-party-benchmark = "e776aa0275e293707b6a0901e0e8d8a8a3679508"
SRCREV_cmake-external-onnx-third-party-pybind11 = "59a2ac2745d8a57ac94c6accced73620d59fb844"
SRCREV_cmake-external-optional-lite = "4acf4553baa886e10e6613fe1452b706b0250e78"
SRCREV_cmake-external-wil = "e8c599bca6c56c44b6730ad93f6abbc9ecd60fc1"
SRCREV_cmake-external-cub = "c3cceac115c072fb63df1836ff46d8c60d9eb304"
SRCREV_cmake-external-nsync = "436617053d0f39a1019a371c3a9aa599b3cb2cea"
SRCREV_cmake-external-protobuf = "498de9f761bef56a032815ee44b6e6dbe0892cc4"
SRCREV_cmake-external-protobuf-third-party-googletest = "5ec7f0c4a113e2f18ac2c6cc7df51ad6afc24081"
SRCREV_cmake-external-protobuf-third-party-benchmark = "5b7683f49e1e9223cf9927b24f6fd3d6bd82e3f8"
SRCREV_cmake-external-cxxopts = "3c73d91c0b04e2b59462f0a741be8c07024c1bc0"
SRCREV_cmake-external-json = "d98bf0278d6f59a58271425963a8422ff48fe249"
SRCREV_cmake-external-SafeInt-safeint = "a104e0cf23be4fe848f7ef1f3e8996fe429b06bb"
SRCREV_cmake-external-FeaturizersLibrary = "fd5fe3de507d4a19f5923c5d4c267e3d730500a9"
SRCREV_cmake-external-FeaturizersLibrary-src-3rdParty-eigen = "efd9867ff0e8df23016ac6c9828d0d7bf8bec1b1"
SRCREV_cmake-external-FeaturizersLibrary-src-3rdParty-re2 = "30cad267151fa8f1b17da8c1ef0571da6da9a8f1"

inherit setuptools3 cmake python3native

DEPENDS += " \
    zlib \
    python3-numpy-native \
    python3-pybind11-native \
    protobuf-native \
    python3-wheel-native \
"

OECMAKE_SOURCEPATH = "${S}/cmake"

DISTUTILS_SETUP_PATH = "${B}"

EXTRA_OECMAKE = " \
    -DONNX_CUSTOM_PROTOC_EXECUTABLE=${STAGING_BINDIR_NATIVE}/protoc \
    -Donnxruntime_RUN_ONNX_TESTS=OFF \
    -Donnxruntime_BUILD_WINML_TESTS=ON \
    -Donnxruntime_GENERATE_TEST_REPORTS=ON \
    -Donnxruntime_DEV_MODE=ON \
    -DPYTHON_EXECUTABLE=${PYTHON} \
    -Donnxruntime_USE_CUDA=OFF \
    -Donnxruntime_CUDA_VERSION= \
    -Donnxruntime_CUDA_HOME= \
    -Donnxruntime_CUDNN_HOME= \
    -Donnxruntime_USE_FEATURIZERS=OFF \
    -Donnxruntime_USE_MIMALLOC_STL_ALLOCATOR=OFF \
    -Donnxruntime_USE_MIMALLOC_ARENA_ALLOCATOR=OFF \
    -Donnxruntime_ENABLE_PYTHON=ON \
    -Donnxruntime_BUILD_CSHARP=OFF \
    -Donnxruntime_BUILD_JAVA=OFF \
    -Donnxruntime_BUILD_NODEJS=OFF \
    -Donnxruntime_BUILD_SHARED_LIB=ON \
    -Donnxruntime_USE_DNNL=OFF \
    -Donnxruntime_DNNL_GPU_RUNTIME= \
    -Donnxruntime_DNNL_OPENCL_ROOT= \
    -Donnxruntime_USE_NNAPI_BUILTIN=OFF \
    -Donnxruntime_USE_RKNPU=OFF \
    -Donnxruntime_USE_OPENMP=OFF \
    -Donnxruntime_USE_TVM=OFF \
    -Donnxruntime_USE_LLVM=OFF \
    -Donnxruntime_ENABLE_MICROSOFT_INTERNAL=OFF \
    -Donnxruntime_USE_VITISAI=OFF \
    -Donnxruntime_USE_NUPHAR=OFF \
    -Donnxruntime_USE_TENSORRT=OFF \
    -Donnxruntime_TENSORRT_HOME= \
    -Donnxruntime_USE_MIGRAPHX=OFF \
    -Donnxruntime_MIGRAPHX_HOME= \
    -Donnxruntime_CROSS_COMPILING=OFF \
    -Donnxruntime_DISABLE_CONTRIB_OPS=OFF \
    -Donnxruntime_DISABLE_ML_OPS=OFF \
    -Donnxruntime_DISABLE_RTTI=OFF \
    -Donnxruntime_DISABLE_EXCEPTIONS=OFF \
    -Donnxruntime_DISABLE_ORT_FORMAT_LOAD=OFF \
    -Donnxruntime_MINIMAL_BUILD=OFF \
    -Donnxruntime_EXTENDED_MINIMAL_BUILD=OFF \
    -Donnxruntime_MINIMAL_BUILD_CUSTOM_OPS=OFF \
    -Donnxruntime_REDUCED_OPS_BUILD=OFF \
    -Donnxruntime_MSVC_STATIC_RUNTIME=OFF \
    -Donnxruntime_ENABLE_LANGUAGE_INTEROP_OPS=OFF \
    -Donnxruntime_USE_DML=OFF \
    -Donnxruntime_USE_WINML=OFF \
    -Donnxruntime_BUILD_MS_EXPERIMENTAL_OPS=OFF \
    -Donnxruntime_USE_TELEMETRY=OFF \
    -Donnxruntime_ENABLE_LTO=OFF \
    -Donnxruntime_USE_ACL=OFF \
    -Donnxruntime_USE_ACL_1902=OFF \
    -Donnxruntime_USE_ACL_1905=OFF \
    -Donnxruntime_USE_ACL_1908=OFF \
    -Donnxruntime_USE_ACL_2002=OFF \
    -Donnxruntime_USE_ARMNN=OFF \
    -Donnxruntime_ARMNN_RELU_USE_CPU=ON \
    -Donnxruntime_ARMNN_BN_USE_CPU=ON \
    -Donnxruntime_ENABLE_NVTX_PROFILE=OFF \
    -Donnxruntime_ENABLE_TRAINING=OFF \
    -Donnxruntime_ENABLE_TRAINING_OPS=OFF \
    -Donnxruntime_ENABLE_CPU_FP16_OPS=OFF \
    -Donnxruntime_USE_NCCL=ON \
    -Donnxruntime_BUILD_BENCHMARKS=OFF \
    -Donnxruntime_USE_ROCM=OFF \
    -Donnxruntime_ROCM_HOME= \
    -DOnnxruntime_GCOV_COVERAGE=OFF \
    -Donnxruntime_USE_MPI=ON \
    -Donnxruntime_ENABLE_MEMORY_PROFILE=OFF \
    -Donnxruntime_ENABLE_CUDA_LINE_NUMBER_INFO=OFF \
    -Donnxruntime_PYBIND_EXPORT_OPSCHEMA=OFF \
    -Donnxruntime_ENABLE_MEMLEAK_CHECKER=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    -Donnxruntime_USE_TIDL=ON \
"

do_install() { 
    cmake_do_install

    install -d ${B}/docs/python

    install -m 0644 ${S}/setup.py ${B}
    install -m 0644 ${S}/requirements.txt ${B}
    install -m 0644 ${S}/docs/python/README.rst ${B}/docs/python

    distutils3_do_install --use_tidl
}

PR_append = "_psdkla_3"
