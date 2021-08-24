SUMMARY = "Compatibility shim to ease adoption of importlib_metadata 3.6"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6"
BBCLASSEXTEND = "native nativesdk"

inherit pypi setuptools3

PYPI_SRC_URI = "https://files.pythonhosted.org/packages/e4/7e/249120b1ba54c70cf988a8eb8069af1a31fd29d42e3e05b9236a34533533/backports.entry_points_selectable-1.1.0.tar.gz"
PYPI_PACKAGE = "backports-entry-points-selectable"
PV = "1.1.0"

SRC_URI[sha256sum] = "988468260ec1c196dab6ae1149260e2f5472c9110334e5d51adcb77867361f6a"

S = "${WORKDIR}/backports.entry_points_selectable-1.1.0"

RDEPENDS_${PN} += ""

FILES_${PN} += "${datadir}/*"
