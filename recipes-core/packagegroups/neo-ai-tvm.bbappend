FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

# We need to use texasinstruments/tvm, so remove the URI and its submodules ...
SRC_URI_remove += "git://github.com/dmlc/tvm;protocol=https;branch=${BRANCH};name=tvm \
		   git://github.com/dmlc/dmlc-core;protocol=https;branch=master;destsuffix=${S}/3rdparty/dmlc-core;name=dmlc-core \
                   git://github.com/dmlc/HalideIR;protocol=https;branch=master;destsuffix=${S}/3rdparty/HalideIR;name=halideir \
                   git://github.com/dmlc/dlpack;protocol=https;branch=master;destsuffix=${S}/3rdparty/dlpack;name=dlpack \
                   git://github.com/agauniyal/rang;protocol=https;branch=master;destsuffix=${S}/3rdparty/rang;name=rang \
                   file://0001-CMakeLists-install-unit-tests.patch \
"

LIC_FILES_CHKSUM_remove += "file://LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e \
			    file://3rdparty/dmlc-core/LICENSE;md5=0ca7d6e8f4af26868cb42025ad83374b \
                            file://3rdparty/dlpack/LICENSE;md5=f62d4e85ba68a1574b74d97ab8dea9ab \
			    file://3rdparty/HalideIR/LICENSE;md5=9910386e68f0616e1ecf1037479fa97e \
"

# ... and add the new URI and add the submodules, again. Note -ti suffixes to make distinct entries
SRC_URI_append += " \
        git://github.com/texasinstruments/tvm;protocol=https;branch=tidl-j7;name=tvm-ti \
        git://github.com/dmlc/dmlc-core;protocol=https;branch=master;destsuffix=${S}/3rdparty/dmlc-core;name=dmlc-core-ti \
        git://github.com/dmlc/dlpack;protocol=https;branch=master;destsuffix=${S}/3rdparty/dlpack;name=dlpack-ti \
        git://github.com/agauniyal/rang;protocol=https;branch=master;destsuffix=${S}/3rdparty/rang;name=rang-ti \
	git://github.com/apache/incubator-tvm-vta;protocol=https;destsuffix=${S}/3rdparty/vta-hw;name=vta-hw-ti \
        file://inc \
"

LIC_FILES_CHKSUM_append += " \
	file://LICENSE;md5=6624767da5fc0a207875418ee416a320 \
	file://3rdparty/dmlc-core/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e \
        file://3rdparty/dlpack/LICENSE;md5=f62d4e85ba68a1574b74d97ab8dea9ab \
        file://3rdparty/rang/LICENSE;md5=911690f51af322440237a253d695d19f \
        file://3rdparty/vta-hw/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e \
"

# Redefine SRCREVs but with -ti suffix;
SRCREV_tvm-ti = "87709a4dc2bef7940e2f1d015f72dfea36ff3d2e"
SRCREV_dmlc-core-ti = "6c401e242c59a1f4c913918246591bb13fd714e7"
SRCREV_dlpack-ti = "3ec04430e89a6834e5a1b99471f415fa939bf642"
SRCREV_rang-ti = "cabe04d6d6b05356fa8f9741704924788f0dd762"
SRCREV_vta-hw-ti = "87ce9acfae550d1a487746e9d06c2e250076e54c"

BBCLASSEXTEND_append += " native"

RDEPENDS_${PN}_remove += "python3-decorator"

EXTRA_OECMAKE += " \
        -DUSE_SORT=ON \
	-DUSE_TIDL=ON \
	-DUSE_TIDL_RT_PATH=${S}/.. \
"

LLVM_RELEASE = "9.0.1"

neo_ai_tvm_do_install() {
    # This does not do anything
    #cmake_do_install

    cd ${S}/../python
    TVM_LIBRARY_PATH=${B} distutils3_do_install

    # setup.py install some libs under datadir, but we don't need them, so remove.
    #rm ${D}${datadir}/tvm/*.so
}

python do_install() {
    d.setVar("S", "${WORKDIR}/git/python")
    bb.build.exec_func("neo_ai_tvm_do_install", d)
    d.setVar("S", "${WORKDIR}/git")
}

PR_append = "_psdkla"

DEPENDS_append_class-native += "python3-wheel"

inherit deploy

do_deploy () {
:
}

do_deploy_append_class-target() {
}

do_deploy_append_class-native() {
    # build the .whl package
    export TVM_LIBRARY_PATH=${B}
    cd ${S}/python 
    ${PYTHON} setup.py bdist_wheel --py-limited-api cp36

    # deploy the .whl package
    install -d ${DEPLOYDIR}
    install -m 644 ${WORKDIR}/git/python/dist/tvm-0.7.dev1-cp36-abi3-linux_x86_64.whl ${DEPLOYDIR}/tvm-0.7.dev1-cp36-abi3-linux_x86_64.whl
}

addtask deploy before do_build after do_compile
