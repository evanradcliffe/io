# Base Io build system
# Written by Jeremy Tregunna <jeremy.tregunna@me.com>
#
# Find libclutter.

FIND_PATH(CLUTTER_INCLUDE_DIR clutter/clutter.h /usr/include/clutter-1.0/ /usr/local/include/clutter-1.0/ /usr/local/clutter-1.0/)

SET(CLUTTER_NAMES ${CLUTTER_NAMES} clutter libclutter)
IF(${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
	LIST(APPEND CLUTTER_NAMES clutter-osx-1.0)
ENDIF(${CMAKE_SYSTEM_NAME} MATCHES "Darwin")

IF(${CMAKE_SYSTEM_NAME} MATCHES "Linux")
	LIST(APPEND CLUTTER_NAMES clutter-glx-1.0)
ENDIF(${CMAKE_SYSTEM_NAME} MATCHES "Linux")

FIND_LIBRARY(CLUTTER_LIBRARY NAMES ${CLUTTER_NAMES} PATH)

IF(CLUTTER_INCLUDE_DIR AND CLUTTER_LIBRARY)
	SET(CLUTTER_FOUND TRUE)
ENDIF(CLUTTER_INCLUDE_DIR AND CLUTTER_LIBRARY)

IF(CLUTTER_FOUND)
	IF(NOT Clutter_FIND_QUIETLY)
		MESSAGE(STATUS "Found Clutter: ${CLUTTER_LIBRARY}")
	ENDIF (NOT Clutter_FIND_QUIETLY)
ELSE(CLUTTER_FOUND)
	IF(Clutter_FIND_REQUIRED)
		MESSAGE(FATAL_ERROR "Could not find clutter")
	ENDIF(Clutter_FIND_REQUIRED)
ENDIF (CLUTTER_FOUND)
