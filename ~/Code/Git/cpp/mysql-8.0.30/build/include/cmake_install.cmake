# Install script for directory: /Users/dingrui/Code/Git/cpp/mysql-8.0.30/include

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/Users/dingrui/Code/Git/cpp/mysql-8.0.30/build")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/Library/Developer/CommandLineTools/usr/bin/objdump")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xDevelopmentx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES
    "/Users/dingrui/Code/Git/cpp/mysql-8.0.30/include/errmsg.h"
    "/Users/dingrui/Code/Git/cpp/mysql-8.0.30/include/my_command.h"
    "/Users/dingrui/Code/Git/cpp/mysql-8.0.30/include/my_compress.h"
    "/Users/dingrui/Code/Git/cpp/mysql-8.0.30/include/my_list.h"
    "/Users/dingrui/Code/Git/cpp/mysql-8.0.30/include/mysql.h"
    "/Users/dingrui/Code/Git/cpp/mysql-8.0.30/include/mysql_com.h"
    "/Users/dingrui/Code/Git/cpp/mysql-8.0.30/include/mysql_time.h"
    "/Users/dingrui/Code/Git/cpp/mysql-8.0.30/~/Code/Git/cpp/mysql-8.0.30/build/include/mysql_version.h"
    "/Users/dingrui/Code/Git/cpp/mysql-8.0.30/~/Code/Git/cpp/mysql-8.0.30/build/include/mysqld_error.h"
    "/Users/dingrui/Code/Git/cpp/mysql-8.0.30/include/field_types.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xDevelopmentx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/mysql" TYPE FILE FILES
    "/Users/dingrui/Code/Git/cpp/mysql-8.0.30/include/mysql/client_plugin.h"
    "/Users/dingrui/Code/Git/cpp/mysql-8.0.30/include/mysql/plugin_auth_common.h"
    "/Users/dingrui/Code/Git/cpp/mysql-8.0.30/include/mysql/udf_registration_types.h"
    )
endif()

