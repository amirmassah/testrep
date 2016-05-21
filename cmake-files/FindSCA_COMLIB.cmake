# - Find SCA_COMLIB
# Find the SCA_COMLIB libraries 
#
#  This module defines the following variables:
#     SCA_COMLIB_FOUND       - True if SCA_COMLIB_INCLUDE_DIR & SCA_COMLIB_LIBRARY are found
#     SCA_COMLIB_LIBRARIES   - Set when SCA_COMLIB_LIBRARY is found
#     SCA_COMLIB_INCLUDE_DIRS - Set when SCA_COMLIB_INCLUDE_DIR is found
#
#     SCA_COMLIB_INCLUDE_DIR - where to find sca_comlib.h, etc.
#     SCA_COMLIB_LIBRARY     - the SCA_COMLIB library
#     SCA_COMLIB_VERSION_STRING - the version of SCA_COMLIB found (since CMake 2.8.8)
#

#=============================================================================
# Copyright 2012 Javier Moreno <moreno@cs.uni-kl.de>
# Copyright 2012 Xiao Pan <pan@cs.uni-kl.de>
#
# Distributed under the OSI-approved BSD License (the "License");
#
# This software is distributed WITHOUT ANY WARRANTY; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the License for more information.
#=============================================================================

find_path(SCA_COMLIB_INCLUDE_DIR NAMES tuv_ams_library tuv_ams_library.h HINTS $ENV{SCA_COMLIB_BASE} $ENV{SCA_COMLIB} 
          PATH_SUFFIXES include
          DOC "The SCA_COMLIB include directory"
)

find_library(SCA_COMLIB_LIBRARY NAMES sca_comlib HINTS $ENV{SCA_COMLIB_BASE} $ENV{SCA_COMLIB} $ENV{SYCYPHOS} $ENV{SCA_COMLIB_BASE}/lib $ENV{SCA_COMLIB}/lib $ENV{SYCYPHOS}/lib 
          PATH_SUFFIXES lib lib-linux lib-linux64 lib-macosx lib-macosx64 Debug
          DOC "The SCA_COMLIB library"
)

#if(SCA_COMLIB_INCLUDE_DIR AND EXISTS "${SCA_COMLIB_INCLUDE_DIR}/version.h")
#  file(STRINGS "${SCA_COMLIB_INCLUDE_DIR}/version.h" sicyphos_version_str REGEX "^#define[\t ]+SCA_COMLIB_DOTTED_VERSION[\t ]\"[0-9].[0-9].[0-9]\"")
#  string(REGEX REPLACE "^.*SCA_COMLIB_DOTTED_VERSION[\t ]\"([0-9]).([0-9]).([0-9]).*$" "\\1.\\2.\\3" SCA_COMLIB_VERSION_STRING "${sicyphos_version_str}")
#  unset(sicyphos_version_str)
#endif()

# handle the QUIETLY and REQUIRED arguments and set SCA_COMLIB_FOUND to TRUE if 
# all listed variables are TRUE
include(${CMAKE_CURRENT_LIST_DIR}/FindPackageHandleStandardArgs.cmake)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(SCA_COMLIB
                                  REQUIRED_VARS SCA_COMLIB_LIBRARY SCA_COMLIB_INCLUDE_DIR
                                  )

if(SCA_COMLIB_FOUND)
  set( SCA_COMLIB_LIBRARIES ${SCA_COMLIB_LIBRARY} )
  set( SCA_COMLIB_INCLUDE_DIRS ${SCA_COMLIB_INCLUDE_DIR} )
endif()

