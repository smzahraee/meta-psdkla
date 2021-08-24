
SUMMARY = "Widget for deck.gl maps"
HOMEPAGE = "https://github.com/visgl/deck.gl/tree/master/bindings/pydeck"
AUTHOR = "Andrew Duberstein <ajduberstein@gmail.com>"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4dea0a48362fab417e3eee4b534adb61"

inherit setuptools3

SRC_URI = "https://files.pythonhosted.org/packages/df/78/de59e1f16a9bd457da749bec57c2a82257361dca42e886b478de373694ef/pydeck-0.6.2.tar.gz"
SRC_URI[md5sum] = "2a5b8715f30dd93e5e9071975f1e4ea6"
SRC_URI[sha256sum] = "24ffadfba72cf610a413d49bd9542f2f4fd745f33d6535dd339b121e9e084be8"

S = "${WORKDIR}/pydeck-0.6.2"

DEPENDS += " ${PYTHON_PN}-jinja2-native"
RDEPENDS_${PN} = "python3-ipywidgets python3-traitlets python3-jinja2 python3-numpy"

BBCLASSEXTEND = "native nativesdk"
