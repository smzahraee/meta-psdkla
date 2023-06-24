SUMMARY = "SSH tunnelling through HTTP proxies"
HOMEPAGE = "https://github.com/bryanpkc/corkscrew"

LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"

SRC_URI = "git://github.com/bryanpkc/corkscrew.git;protocol=https;branch=master"
SRCREV = "e351bdaa911b102094e8c9c50e7fafcf4e660a47"

S = "${WORKDIR}/git"

inherit autotools

PR:append = "_psdkla1"
