
SUMMARY = "Python Git Library"
HOMEPAGE = "https://github.com/gitpython-developers/GitPython"
AUTHOR = "Sebastian Thiel, Michael Trier <byronimo@gmail.com, mtrier@gmail.com>"
LICENSE = "BSD"
LIC_FILES_CHKSUM = "file://LICENSE;md5=8b8d26c37c1d5a04f9b0186edbebc183"

inherit setuptools3

SRC_URI = "https://files.pythonhosted.org/packages/29/22/3d591875078c1c5e7e11b478616821995053968a74b76043c55448c46381/GitPython-3.1.18.tar.gz"
SRC_URI[md5sum] = "a5808593ee15ad33861ada6797edf159"
SRC_URI[sha256sum] = "b838a895977b45ab6f0cc926a9045c8d1c44e2b653c1fcc39fe91f42c6e8f05b"

S = "${WORKDIR}/GitPython-3.1.18"

DEPENDS += " "
RDEPENDS_${PN} = "python3-gitdb"

BBCLASSEXTEND = "native nativesdk"
