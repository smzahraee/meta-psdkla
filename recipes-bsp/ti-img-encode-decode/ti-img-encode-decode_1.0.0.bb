SUMMARY = "Kernel drivers for the IMG VXE384 MP2 and D5520 encoder/decoder found in TI SoCs"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://driver/common/dq.c;beginline=1;endline=16;md5=e015e28ff5e88576dab9fdf641e3dbfe"

inherit module

MACHINE_KERNEL_PR_append = "g"
PR = "${MACHINE_KERNEL_PR}"

COMPATIBLE_MACHINE = "j7-evm"

SRCREV = "510439deecb584d2277ca9619ea546c81c778752"

EXTRA_OEMAKE = "KPATH=${STAGING_KERNEL_DIR} KCONF=${STAGING_KERNEL_BUILDDIR}"
TARGET_CC_ARCH += "${LDFLAGS}"

BRANCH = "master"
SRC_URI = "git://git.ti.com/jacinto7_multimedia/ti-img-encode-decode.git;protocol=git;branch=${BRANCH} \
           file://0001-TI-IMG-video-codec-driver-porting-to-ti-linux-5.4.y.patch \
           file://0002-Decoder-driver-hanging-on-Gstreamer-and-standalone-t.patch \
           file://0001-Removed-Encode-Decoder-Makefile-dependency-on-.confi.patch \
"

S = "${WORKDIR}/git"

do_compile() {
	oe_runmake all -C ${S}/linux/decoder
	oe_runmake all -C ${S}/linux/encoder
}

do_install() {
	install -d ${D}/${base_libdir}/modules/${KERNEL_VERSION}/extra
	install -m 644 ${S}/linux/decoder/vxd-dec.ko ${D}/${base_libdir}/modules/${KERNEL_VERSION}/extra
	install -m 644 ${S}/linux/encoder/vxe-enc.ko ${D}/${base_libdir}/modules/${KERNEL_VERSION}/extra
}
