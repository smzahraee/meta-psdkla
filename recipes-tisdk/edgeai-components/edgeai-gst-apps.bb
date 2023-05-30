SUMMARY = "EdgeAI Gst Apps"
DESCRIPTION = "EdgeAI Gst Apps implements gstreamer based simple deep learning demos that runs on TI platforms"
HOMEPAGE = "https://github.com/TexasInstruments/edgeai-gst-apps"

LICENSE = "TI-TFL"
LIC_FILES_CHKSUM = "file://${WORKDIR}/git/LICENSE;md5=dc68ab0305d85e56491b9a9aed2309f2"

SRC_URI = "git://github.com/TexasInstruments/edgeai-gst-apps.git;tag=EDGEAI_APP_STACK_08_06_01_00;nobranch=1;protocol=https"

PLAT_SOC = ""
PLAT_SOC_j7-evm = "j721e"
PLAT_SOC_j7-hs-evm = "j721e"
PLAT_SOC_j721s2-evm = "j721s2"
PLAT_SOC_j721s2-hs-evm = "j721s2"
PLAT_SOC_j784s4-evm = "j784s4"
PLAT_SOC_j784s4-hs-evm = "j784s4"
PLAT_SOC_am62axx-evm = "am62a"

S = "${WORKDIR}/git/apps_cpp"

DEPENDS = "ti-tisdk-firmware edgeai-dl-inferer yaml-cpp gstreamer1.0 opencv"

RDEPENDS_${PN} += "edgeai-gst-plugins edgeai-dl-inferer-staticdev"

RDEPENDS_${PN}-source += "bash python3-core edgeai-dl-inferer-dev"

COMPATIBLE_MACHINE = "j7-evm|j7-hs-evm|j721s2-evm|j721s2-hs-evm|j784s4-evm|j784s4-hs-evm|am62axx-evm"

export SOC = "${PLAT_SOC}"

EXTRA_OECMAKE = "-DTARGET_FS=${WORKDIR}/recipe-sysroot -DCMAKE_SKIP_RPATH=TRUE"

PACKAGES += "${PN}-source"
FILES_${PN}-source += "/opt"

inherit cmake

do_install() {
    CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"

    mkdir -p ${D}/opt/edgeai-gst-apps
    cp ${CP_ARGS} ${WORKDIR}/git/* ${D}/opt/edgeai-gst-apps
    rm -rf ${D}/opt/edgeai-gst-apps/apps_cpp/lib

    mkdir -p ${D}/opt/model_zoo
    mkdir -p ${D}/opt/edgeai-test-data
    mkdir -p ${D}/opt/oob-demo-assets
    export SOC="${PLAT_SOC}"
    export EDGEAI_DATA_PATH=${WORKDIR}/edgeai-test-data
    export OOB_DEMO_ASSETS_PATH=${WORKDIR}/oob-demo-assets
    export EDGEAI_SDK_VERSION=08_06_00

    cd ${WORKDIR}/git/
    ./download_models.sh --recommended
    ./download_test_data.sh
    cd $OOB_DEMO_ASSETS_PATH
    for i in *.h264
    do
      ln -sf /opt/oob-demo-assets/$i $EDGEAI_DATA_PATH/videos/$i
    done
    cp ${CP_ARGS} ${WORKDIR}/model_zoo/* ${D}/opt/model_zoo
    cp ${CP_ARGS} ${WORKDIR}/edgeai-test-data/* ${D}/opt/edgeai-test-data
    cp ${CP_ARGS} ${WORKDIR}/oob-demo-assets/* ${D}/opt/oob-demo-assets
}

INSANE_SKIP_${PN}-source += "dev-deps"

PR = "r5"
