RDEPENDS_${PN}_append = " \
	ti-heartbeat-cluster-vm \
	ti-heartbeat-ivi-vm \
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
        websocketd \
        statcol \
"

PR_append = "_psdkla"
