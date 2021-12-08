PR_append = ".arago0"

do_install_append() {
    rm -rf ${D}${systemd_system_unitdir}
}

FILES_${PN}_remove = "${systemd_system_unitdir}/weston@.service"
SYSTEMD_SERVICE_${PN}_remove = "weston@%i.service"
