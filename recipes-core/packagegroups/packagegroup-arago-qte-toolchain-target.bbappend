PR_append = "_psdkla0"

QT5_DEV_remove = "\
    ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', '', 'qtwebengine-mkspecs qtwebengine-dev', d)} \
"

QT5_DEV_append = "\
    ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', '', ' qtwebkit-mkspecs qtwebkit-dev qtquick1-dev', d)} \
"
