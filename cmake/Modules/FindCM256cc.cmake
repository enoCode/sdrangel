INCLUDE(FindPkgConfig)
PKG_CHECK_MODULES(PC_CM256cc "libcm256cc")

FIND_PATH(CM256CC_INCLUDE_DIR
    NAMES cm256.h
    HINTS ${PC_CM256CC_INCLUDE_DIR}
    ${CMAKE_INSTALL_PREFIX}/include
    ${LIBCM256CC_INSTALL_PREFIX}/include
    PATHS
    /usr/local/include
    /usr/include
)

FIND_LIBRARY(CM256CC_LIBRARIES
    NAMES cm256cc libcm256cc
    HINTS ${PC_CM256CC_LIBDIR}
    ${CMAKE_INSTALL_PREFIX}/lib
    ${CMAKE_INSTALL_PREFIX}/lib64
    PATHS
    ${CM256CC_INCLUDE_DIR}/../lib
    /usr/local/lib
    /usr/lib
)

if(CM256CC_INCLUDE_DIR AND CM256CC_LIBRARIES)
    set(CM256CC_FOUND TRUE CACHE INTERNAL "CM256CC found")
    message(STATUS "Found CM256cc: ${CM256CC_INCLUDE_DIR}, ${CM256CC_LIBRARIES}")
else(CM256CC_INCLUDE_DIR AND CM256CC_LIBRARIES)
    set(CM256CC_FOUND FALSE CACHE INTERNAL "CM256CC found")
    message(STATUS "CM256cc not found")
endif(CM256CC_INCLUDE_DIR AND CM256CC_LIBRARIES)

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(CM256CC DEFAULT_MSG CM256CC_LIBRARIES CM256CC_INCLUDE_DIR)
MARK_AS_ADVANCED(CM256CC_LIBRARIES CM256CC_INCLUDE_DIR)
