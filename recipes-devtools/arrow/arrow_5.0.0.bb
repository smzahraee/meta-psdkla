SUMMARY = "Apache Arrow"
LICENSE = "Apache"
LIC_FILES_CHKSUM = "file://${WORKDIR}/apache-arrow-5.0.0/LICENSE.txt;md5=95c1edde0c6923f45c120b96056df8f1"
BBCLASSEXTEND = "native nativesdk"

SRC_URI = "https://mirror.cogentco.com/pub/apache/arrow/arrow-5.0.0/apache-arrow-5.0.0.tar.gz;name=arrow \
           https://github.com/xtensor-stack/xsimd/archive/e9234cd6e6f4428fc260073b2c34ffe86fda1f34.tar.gz;name=xsimd;unpack=0 \
           https://github.com/jemalloc/jemalloc/releases/download/5.2.1/jemalloc-5.2.1.tar.bz2;name=jemalloc;unpack=0 \
           https://github.com/google/re2/archive/2021-02-02.tar.gz;name=re2c;unpack=0 \
           https://github.com/JuliaStrings/utf8proc/archive/v2.6.1.tar.gz;name=utf8proc;unpack=0 \
           file://0001-Added-host-aarch64-linux-to-ThirdpartyToolchain.cmak.patch;patch=1"

SRC_URI[arrow.sha256sum] = "c3b4313eca594c20f761a836719721aaf0760001af896baec3ab64420ff9910a"
SRC_URI[xsimd.sha256sum] = "1e98bae41abae7f3f6fa4c70ec2dcad008d831876009aa047fb69fd5b24076fd"
SRC_URI[jemalloc.sha256sum] = "34330e5ce276099e2e8950d9335db5a875689a4c6a56751ef3b1d8c537f887f6"
SRC_URI[re2c.sha256sum] = "1396ab50c06c1a8885fb68bf49a5ecfd989163015fd96699a180d6414937f33f"
SRC_URI[utf8proc.sha256sum] = "4c06a9dc4017e8a2438ef80ee371d45868bda2237a98b26554de7a95406b283b"

S = "${WORKDIR}/apache-arrow-5.0.0/cpp"

DEPENDS += "python3-numpy-native rapidjson-native re2c-native python3-native"

EXTRA_OECMAKE += " -DARROW_PYTHON=ON"

inherit cmake python3native

export ARROW_JEMALLOC_URL="${S}/jemalloc-5.2.1.tar.bz2"
export ARROW_XSIMD_URL="${S}/e9234cd6e6f4428fc260073b2c34ffe86fda1f34.tar.gz"
export ARROW_RE2_URL="${S}/2021-02-02.tar.gz"
export ARROW_UTF8PROC_URL="${S}/v2.6.1.tar.gz"

do_compile_prepend(){
  cp ${WORKDIR}/e9234cd6e6f4428fc260073b2c34ffe86fda1f34.tar.gz ${S}
  cp ${WORKDIR}/jemalloc-5.2.1.tar.bz2 ${S}
  cp ${WORKDIR}/2021-02-02.tar.gz ${S}
  cp ${WORKDIR}/v2.6.1.tar.gz ${S}
}
