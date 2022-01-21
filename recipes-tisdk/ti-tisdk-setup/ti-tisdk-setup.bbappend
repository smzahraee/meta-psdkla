PR_append = "_psdkla_1"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
        file://0001-create-sdcard.sh-Stop-using-cylinder-as-unit-for-par.patch \
"
