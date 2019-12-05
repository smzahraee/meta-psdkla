RDEPENDS_${PN}_append = " \
	gpu-cluster \
	ti-heartbeat-cluster-vm \
	ti-heartbeat-ivi-vm \
	cockpit-fw \
	cockpit-can-fw \
	rpmsg-char-helper \
	rpmsg-char-helper-dev \
	cmem \
        cmem-dev \
        libdrm-dev \
        ti-img-rogue-umlibs-dev \
        glsdk-util-scripts \
        libion \
        libion-dev \
        oob-demo \
"

PR_append = "_psdkla"
