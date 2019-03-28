SUMMARY = "Texas Instruments Inter-VM heartbeat application recipe"

LICENSE = "BSD"
LIC_FILES_CHKSUM = "file://LICENSE;md5=a4a199b1c95f2029f8663c25bf308c59"

PROTOCOL = "http"
BRANCH = "master"
SRCREV = "8e4696281ab0521a3867ae11431cbc0c912dce8a"
SRC_URI = "git://bitbucket.itg.ti.com/scm/psdkla/ti-heartbeat.git;protocol=${PROTOCOL};branch=${BRANCH}"

S = "${WORKDIR}/git"

inherit autotools pkgconfig

EXTRA_OECONF += " \
	--enable-heartbeat-provider \
"

PR_append = "_psdkla_1"
