
SUMMARY = "Base58 and Base58Check implementation."
HOMEPAGE = "https://github.com/keis/base58"
AUTHOR = "David Keijser <keijser@gmail.com>"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://COPYING;md5=71074cfe47bd07c35127d81190aafd41"

inherit setuptools3

SRC_URI = "https://files.pythonhosted.org/packages/b5/c1/8e77d5389cf1ea2535049e5ffaeb241cce21bcc1c42624b3e8d0fb3bb607/base58-2.1.0.tar.gz"
SRC_URI[md5sum] = "7cc7878754667094e4964e5fdd5a2905"
SRC_URI[sha256sum] = "171a547b4a3c61e1ae3807224a6f7aec75e364c4395e7562649d7335768001a2"

S = "${WORKDIR}/base58-2.1.0"

DEPENDS += " "
RDEPENDS_${PN} = ""

BBCLASSEXTEND = "native nativesdk"
