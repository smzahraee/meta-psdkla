
PR:append = "_psdkla_0"

do_install:append() {
	sed -i "s/GPLv3/GPL-3.0/g" ${D}${sysconfdir}/init.d/gplv3-notice
}

