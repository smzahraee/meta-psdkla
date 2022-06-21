PR_append = "_psdkla_4"

MATRIX_COMMON_APPS_remove = " \
    matrix-gui-oprofile-demos \
"

MATRIX_APPS_remove_dra7xx = " \
    matrix-multimedia-demo-dsp66imgproc \
"

MATRIX_OPENCL_APPS_remove_dra7xx = " \
    matrix-video-analytics-opencv-opencl-opengl-demo \
    matrix-machinevision-demo-dlp3dscanner \
"

MATRIX_OPENCL_APPS_remove_am57xx-evm = " \
    matrix-opencl-demo-floatcompute  \
    matrix-opencl-demo-vecadd        \
"

MATRIX_GPU_DEMOS_remove_omap-a15 = " \
    matrix-3d-demo-kmscubevideo \
"

MATRIX_APPS_remove_omap-a15 = " \
    matrix-multimedia-demo-ivahdmjpegenc \
    matrix-multimedia-demo-vip-vpe-ivahdmpeg4encdec \
    matrix-multimedia-demo-ivahdh264enc \
"

MATRIX_QT_APPS_remove_omap-a15 = " \
    matrix-analytics-pdm-anomaly-detection \
"

MATRIX_APPS_append_am57xx-evm = " \
    matrix-gui-apps-dual-camera \
    matrix-gui-apps-image-gallery \
"
MATRIX_APPS_append_am57xx-hs-evm = " \
    matrix-gui-apps-dual-camera \
    matrix-gui-apps-image-gallery \
"
MATRIX_OPENCV_OPENCL_APPS_remove_omap-a15 = " \
     matrix-machinevision-demo-barcoderoi \
     matrix-machinevision-demo-simplepeopletracking \
"
