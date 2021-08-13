
SUMMARY = "C parser in Python"
HOMEPAGE = "https://github.com/eliben/pycparser"
AUTHOR = "Eli Bendersky <eliben@gmail.com>"
LICENSE = "BSD"
LIC_FILES_CHKSUM = "file://LICENSE;md5=86f1cedb4e6410a88ce8e30b91079169"

SRC_URI = "https://files.pythonhosted.org/packages/0f/86/e19659527668d70be91d0369aeaa055b4eb396b0f387a4f92293a20035bd/pycparser-2.20.tar.gz"
SRC_URI[md5sum] = "b8f88de737db8c346ee8d31c07c7a25a"
SRC_URI[sha256sum] = "2d475327684562c3a96cc71adf7dc8c4f0565175cf86b6d7a404ff4c771f15f0"

S = "${WORKDIR}/pycparser-2.20"

RDEPENDS_${PN} = ""

inherit setuptools3
