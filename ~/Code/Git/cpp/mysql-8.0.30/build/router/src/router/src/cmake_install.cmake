# Install script for directory: /Users/dingrui/Code/Git/cpp/mysql-8.0.30/router/src/router/src

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

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRouterx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "/Users/dingrui/Code/Git/cpp/mysql-8.0.30/~/Code/Git/cpp/mysql-8.0.30/build/runtime_output_directory/mysqlrouter")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/mysqlrouter" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/mysqlrouter")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/Users/dingrui/Code/Git/cpp/mysql-8.0.30/~/Code/Git/cpp/mysql-8.0.30/build/library_output_directory"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/mysqlrouter")
    execute_process(COMMAND /usr/bin/install_name_tool
      -add_rpath "@loader_path/../"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/mysqlrouter")
    execute_process(COMMAND /usr/bin/install_name_tool
      -add_rpath "@loader_path/"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/mysqlrouter")
    execute_process(COMMAND /usr/bin/install_name_tool
      -add_rpath "@loader_path/../lib/"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/mysqlrouter")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Library/Developer/CommandLineTools/usr/bin/strip" -u -r "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/mysqlrouter")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRouterx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/Users/dingrui/Code/Git/cpp/mysql-8.0.30/~/Code/Git/cpp/mysql-8.0.30/build/library_output_directory/libmysqlrouter.1.dylib")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmysqlrouter.1.dylib" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmysqlrouter.1.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/Users/dingrui/Code/Git/cpp/mysql-8.0.30/~/Code/Git/cpp/mysql-8.0.30/build/library_output_directory"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmysqlrouter.1.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -add_rpath "@loader_path/../"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmysqlrouter.1.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -add_rpath "@loader_path/"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmysqlrouter.1.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -add_rpath "@loader_path/../lib/"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmysqlrouter.1.dylib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Library/Developer/CommandLineTools/usr/bin/strip" -x "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmysqlrouter.1.dylib")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRouterx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "/Users/dingrui/Code/Git/cpp/mysql-8.0.30/~/Code/Git/cpp/mysql-8.0.30/build/runtime_output_directory/mysqlrouter_keyring")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/mysqlrouter_keyring" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/mysqlrouter_keyring")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/Users/dingrui/Code/Git/cpp/mysql-8.0.30/~/Code/Git/cpp/mysql-8.0.30/build/library_output_directory"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/mysqlrouter_keyring")
    execute_process(COMMAND /usr/bin/install_name_tool
      -add_rpath "@loader_path/../"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/mysqlrouter_keyring")
    execute_process(COMMAND /usr/bin/install_name_tool
      -add_rpath "@loader_path/"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/mysqlrouter_keyring")
    execute_process(COMMAND /usr/bin/install_name_tool
      -add_rpath "@loader_path/../lib/"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/mysqlrouter_keyring")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Library/Developer/CommandLineTools/usr/bin/strip" -u -r "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/mysqlrouter_keyring")
    endif()
  endif()
endif()

