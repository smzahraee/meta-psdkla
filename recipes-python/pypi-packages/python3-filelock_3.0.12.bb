
SUMMARY = "A platform independent file lock."
HOMEPAGE = "https://github.com/benediktschmitt/py-filelock"
AUTHOR = "Benedikt Schmitt <benedikt@benediktschmitt.de>"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://LICENSE;md5=911690f51af322440237a253d695d19f"

inherit setuptools3

SRC_URI = "https://files.pythonhosted.org/packages/14/ec/6ee2168387ce0154632f856d5cc5592328e9cf93127c5c9aeca92c8c16cb/filelock-3.0.12.tar.gz"
SRC_URI[md5sum] = "c1fe6d9a7433a7ca6ce4f36e273317d1"
SRC_URI[sha256sum] = "18d82244ee114f543149c66a6e0c14e9c4f8a1044b5cdaadd0f82159d6a6ff59"

S = "${WORKDIR}/filelock-3.0.12"

DEPENDS += " "
RDEPENDS_${PN} = ""

BBCLASSEXTEND = "native nativesdk"
