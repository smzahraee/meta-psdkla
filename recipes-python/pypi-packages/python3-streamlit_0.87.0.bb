
SUMMARY = "The fastest way to build data apps in Python"
HOMEPAGE = "https://streamlit.io"
AUTHOR = "Streamlit Inc <hello@streamlit.io>"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://setup.py;md5=b472f324051cb08cb4858daac2ab894b"

inherit setuptools3

SRC_URI = "https://files.pythonhosted.org/packages/84/8d/bca09a2586eb22d31236974efaa9006a4df8e8cc6f9215977785b5b67c8e/streamlit-0.87.0.tar.gz"
SRC_URI[md5sum] = "fcd36ccdce0dad239ec92d92c02ee79b"
SRC_URI[sha256sum] = "7e63e3ac025717ff9c9a8c1903fa528ad0598b09b76705e54e2728a3d9d90aad"

S = "${WORKDIR}/streamlit-0.87.0"

DEPENDS += "python3-pipenv-native"
RDEPENDS_${PN} = "python3-altair python3-astor python3-attrs python3-base58 python3-blinker python3-cachetools python3-click python3-numpy python3-packaging python3-pandas python3-pillow python3-protobuf python3-pydeck python3-dateutil python3-requests python3-toml python3-tornado python3-tzlocal python3-validators python3-gitpython"

BBCLASSEXTEND = "native nativesdk"
