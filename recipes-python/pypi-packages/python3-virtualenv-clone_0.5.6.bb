
SUMMARY = "script to clone virtualenvs."
HOMEPAGE = "https://github.com/edwardgeorge/virtualenv-clone"
AUTHOR = "Edward George <edwardgeorge@gmail.com>"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://LICENSE;md5=93a0ae49656299faef17cb7fece99e95"

inherit setuptools3

SRC_URI = "https://files.pythonhosted.org/packages/a9/bb/ab59bdb1dc8e14add54c70e9bccb8d54379bdf73ec8cebbbf638ab76590f/virtualenv-clone-0.5.6.tar.gz"
SRC_URI[md5sum] = "d80edafbb8ec1b2d88a0aac002d2ebb4"
SRC_URI[sha256sum] = "997c7d225eabc4d09e77672461f4bdf9f3a8ea9dc9e4a847b0e83dc8bad9573a"

S = "${WORKDIR}/virtualenv-clone-0.5.6"

DEPENDS += " "
RDEPENDS_${PN} = ""

BBCLASSEXTEND = "native nativesdk"
