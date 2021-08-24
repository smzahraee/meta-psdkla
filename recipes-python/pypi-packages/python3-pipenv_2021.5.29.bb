
SUMMARY = "Python Development Workflow for Humans."
HOMEPAGE = "https://github.com/pypa/pipenv"
AUTHOR = "Pipenv maintainer team <distutils-sig@python.org>"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://LICENSE;md5=2545306c7b8fbb80beec75825260e80f"

inherit setuptools3

SRC_URI = "https://files.pythonhosted.org/packages/be/c5/a7c300c4589e898db8cfcf26f7065c24e2f5abacaea196a7f80e6695344d/pipenv-2021.5.29.tar.gz"
SRC_URI[md5sum] = "0afae0824bf69d6ae5e33900fb270a2c"
SRC_URI[sha256sum] = "05958fadcd70b2de6a27542fcd2bd72dd5c59c6d35307fdac3e06361fb06e30e"

S = "${WORKDIR}/pipenv-2021.5.29"

DEPENDS += " "
RDEPENDS_${PN} = "python3-pip python3-certifi python3-setuptools python3-virtualenv-clone python3-virtualenv"

BBCLASSEXTEND = "native nativesdk"
