
SUMMARY = "Altair: A declarative statistical visualization library for Python."
HOMEPAGE = "http://altair-viz.github.io"
AUTHOR = "Brian E. Granger / Jake VanderPlas <jakevdp@gmail.com>"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://LICENSE;md5=0b6a94a369156b60acae8027cfeadf24"

inherit setuptools3

SRC_URI = "https://files.pythonhosted.org/packages/ab/21/b2e7de05af65d89c5bf8f716fe2949e4f99a7809530ecb8f8e22a2e1c778/altair-4.1.0.tar.gz"
SRC_URI[md5sum] = "c96c77362947c21f6dd5c3d38e21246b"
SRC_URI[sha256sum] = "3edd30d4f4bb0a37278b72578e7e60bc72045a8e6704179e2f4738e35bc12931"

S = "${WORKDIR}/altair-4.1.0"

DEPENDS += " "
RDEPENDS_${PN} = "python3-entrypoints python3-jinja2 python3-jsonschema python3-numpy python3-pandas python3-toolz"

BBCLASSEXTEND = "native nativesdk"
