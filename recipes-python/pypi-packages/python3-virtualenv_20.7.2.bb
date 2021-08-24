
SUMMARY = "Virtual Python Environment builder"
HOMEPAGE = "https://virtualenv.pypa.io/"
AUTHOR = "Bernat Gabor <gaborjbernat@gmail.com>"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://LICENSE;md5=0ce089158cf60a8ab6abb452b6405538"

inherit setuptools3

SRC_URI = "https://files.pythonhosted.org/packages/6d/89/9691b0d0521c069bd238585ccb7f4035b8393d843a50491270e7dae0209e/virtualenv-20.7.2.tar.gz"
SRC_URI[md5sum] = "0695fb2609140cedd0e7388ad8664296"
SRC_URI[sha256sum] = "9ef4e8ee4710826e98ff3075c9a4739e2cb1040de6a2a8d35db0055840dc96a0"

S = "${WORKDIR}/virtualenv-20.7.2"

DEPENDS += " ${PYTHON_PN}-setuptools-scm-native"
RDEPENDS_${PN} = "python3-backports-entry-points-selectable python3-distlib python3-filelock python3-platformdirs python3-six"

BBCLASSEXTEND = "native nativesdk"
