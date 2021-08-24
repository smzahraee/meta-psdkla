

SUMMARY = "Python library for Apache Arrow"
HOMEPAGE = "https://arrow.apache.org/"
AUTHOR = " <>"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://setup.py;md5=9ca39e68a3bca0f0e1fed484c19285dc"

inherit setuptools3 cmake

SRC_URI = "https://files.pythonhosted.org/packages/68/7c/0e38bfb949ededdd9b648d54cba47972835704543d7409d6f853504d0581/pyarrow-5.0.0.tar.gz"
SRC_URI[md5sum] = "834b1396197c002450bd816dacaf7442"
SRC_URI[sha256sum] = "24e64ea33eed07441cc0e80c949e3a1b48211a1add8953268391d250f4d39922"

S = "${WORKDIR}/pyarrow-5.0.0"

DEPENDS += "python3-cython-native python3-setuptools-scm-native python3-numpy-native arrow-native"

EXTRA_OECMAKE="-DCMAKE_BUILD_TYPE=release \
	  -DArrowPython_DIR:PATH=/work/aniket/ybd/k3-yocto-10-Aug/build/arago-tmp-external-arm-glibc/work/aarch64-linux/python3-pyarrow/5.0.0-r0/recipe-sysroot-native/usr/lib/cmake/arrow"

BBCLASSEXTEND = "native nativesdk"
