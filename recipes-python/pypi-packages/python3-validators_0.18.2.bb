
SUMMARY = "Python Data Validation for Humans™."
HOMEPAGE = "https://github.com/kvesteri/validators"
AUTHOR = "Konsta Vesterinen <konsta@fastmonkeys.com>"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://LICENSE;md5=2c4bb3fb5c2325bfca6c6358ba1d89e6"

inherit setuptools3

SRC_URI = "https://files.pythonhosted.org/packages/33/1a/4e4c12982b093796c1ceaff49cbc5998fb3a7866da755f8e7a1a40b8fda4/validators-0.18.2.tar.gz"
SRC_URI[md5sum] = "eeda94e9b38fd2d54e9c28537b79cf06"
SRC_URI[sha256sum] = "37cd9a9213278538ad09b5b9f9134266e7c226ab1fede1d500e29e0a8fbb9ea6"

S = "${WORKDIR}/validators-0.18.2"

DEPENDS += " "
RDEPENDS_${PN} = "python3-six python3-decorator"

BBCLASSEXTEND = "native nativesdk"
