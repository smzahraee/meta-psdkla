
SUMMARY = "Distribution utilities"
HOMEPAGE = "https://bitbucket.org/pypa/distlib"
AUTHOR = "Vinay Sajip <vinay_sajip@red-dove.com>"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f6a11430d5cd6e2cd3832ee94f22ddfc"

inherit setuptools3

SRC_URI = "https://files.pythonhosted.org/packages/45/97/15fdbef466e12c890553cebb1d8b1995375202e30e0c83a1e51061556143/distlib-0.3.2.zip"
SRC_URI[md5sum] = "50196f22cc2ed82fe2cf6c8fa3220d78"
SRC_URI[sha256sum] = "106fef6dc37dd8c0e2c0a60d3fca3e77460a48907f335fa28420463a6f799736"

S = "${WORKDIR}/distlib-0.3.2"

DEPENDS += " "
RDEPENDS_${PN} = ""

BBCLASSEXTEND = "native nativesdk"
