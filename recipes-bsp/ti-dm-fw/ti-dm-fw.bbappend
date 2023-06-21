PR:append = "_psdkla_0"

do_deploy:append(){
    install -d ${DEPLOYDIR}/${DM_FW_DIR}
    for FW_NAME in ${DM_FW_LIST}
    do
        install -m 0644 ${S}/${DM_FW_DIR}/${FW_NAME}        ${DEPLOYDIR}/${DM_FW_DIR}
    done
}
