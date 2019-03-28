SUMMARY = "Rpmsg char Helper library recipe"

LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://rpmsg_char_helper.c;beginline=1;endline=10;md5=5c0d2c7a0cb216a82b4160327fe020e8"

PROTOCOL = "http"
BRANCH = "master"
SRCREV = "26b118ea96eb952528d8e4b034d87ead0cc780a7"
SRC_URI = "git://bitbucket.itg.ti.com/scm/psdkla/rpmsg_char_helper.git;protocol=${PROTOCOL};branch=${BRANCH}"

S = "${WORKDIR}/git"

inherit autotools pkgconfig

EXTRA_OECONF += " \
	--with-soc=j7 \
"

PR_append = "_psdkla_1"
