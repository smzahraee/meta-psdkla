RDEPENDS_${PN}_append = " \
	rpmsg-char-helper \
	rpmsg-char-helper-dev \
	cmem \
	cmem-dev \
	cockpit-fw \
	cockpit-can-fw \
	cluster \
	ti-heartbeat-cluster-vm \
	ti-heartbeat-ivi-vm \
	libdrm-dev \
	ti-img-rogue-umlibs-dev \
"

PR_append = "_psdkla"
