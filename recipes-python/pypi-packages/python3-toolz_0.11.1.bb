
SUMMARY = "List processing tools and functional utilities"
HOMEPAGE = "https://github.com/pytoolz/toolz/"
AUTHOR = "https://raw.github.com/pytoolz/toolz/master/AUTHORS.md <>"
LICENSE = "BSD"
LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ca09cab178326d18433aae982d1edf5d"

inherit setuptools3

SRC_URI = "https://files.pythonhosted.org/packages/d6/0d/fdad31347bf3d058002993a094da1ca95f0f3ef9beec08856d0fe4ad9766/toolz-0.11.1.tar.gz"
SRC_URI[md5sum] = "492704a7c971a52f6e5ac428aab94414"
SRC_URI[sha256sum] = "c7a47921f07822fe534fb1c01c9931ab335a4390c782bd28c6bcc7c2f71f3fbf"

S = "${WORKDIR}/toolz-0.11.1"

DEPENDS += " "
RDEPENDS_${PN} = ""

BBCLASSEXTEND = "native nativesdk"
