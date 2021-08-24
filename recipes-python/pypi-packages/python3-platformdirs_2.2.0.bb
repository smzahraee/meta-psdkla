
SUMMARY = "A small Python module for determining appropriate platform-specific dirs, e.g. a "user data dir"."
HOMEPAGE = "https://github.com/platformdirs/platformdirs"
AUTHOR = " <>"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=282c970bb844954c8535dd6e9733db7f"

inherit setuptools3

SRC_URI = "https://files.pythonhosted.org/packages/58/cb/ee4234464290e3dee893cf37d1adc87c24ade86ff6fc55f04a9bf9f1ec4f/platformdirs-2.2.0.tar.gz"
SRC_URI[md5sum] = "aaf02d3d87404767abc335d4bd4536e8"
SRC_URI[sha256sum] = "632daad3ab546bd8e6af0537d09805cec458dce201bccfe23012df73332e181e"

S = "${WORKDIR}/platformdirs-2.2.0"

DEPENDS += " "
RDEPENDS_${PN} = ""

BBCLASSEXTEND = "native nativesdk"
