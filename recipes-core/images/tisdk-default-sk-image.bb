# Produces wic Image targeted for SK platforms

require recipes-core/images/tisdk-default-image.bb
require tisdk-default-image.inc

export IMAGE_BASENAME = "tisdk-default-sk-image"

PR = "psdkla_0"
