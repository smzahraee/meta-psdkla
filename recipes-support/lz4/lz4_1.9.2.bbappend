BRANCH = "dev"

SRC_URI = "git://github.com/lz4/lz4.git;branch=${BRANCH} \
           file://run-ptest \
           "

PR_append = "_psdk_1"

