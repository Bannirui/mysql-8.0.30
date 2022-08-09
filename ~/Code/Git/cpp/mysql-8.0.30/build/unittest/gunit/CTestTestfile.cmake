# CMake generated Testfile for 
# Source directory: /Users/dingrui/Code/Git/cpp/mysql-8.0.30/unittest/gunit
# Build directory: /Users/dingrui/Code/Git/cpp/mysql-8.0.30/~/Code/Git/cpp/mysql-8.0.30/build/unittest/gunit
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(merge_small_tests "/Users/dingrui/Code/Git/cpp/mysql-8.0.30/~/Code/Git/cpp/mysql-8.0.30/build/runtime_output_directory/merge_small_tests-t")
set_tests_properties(merge_small_tests PROPERTIES  _BACKTRACE_TRIPLES "/Users/dingrui/Code/Git/cpp/mysql-8.0.30/cmake/mysql_add_executable.cmake;176;ADD_TEST;/Users/dingrui/Code/Git/cpp/mysql-8.0.30/unittest/gunit/CMakeLists.txt;358;MYSQL_ADD_EXECUTABLE;/Users/dingrui/Code/Git/cpp/mysql-8.0.30/unittest/gunit/CMakeLists.txt;0;")
add_test(merge_large_tests "/Users/dingrui/Code/Git/cpp/mysql-8.0.30/~/Code/Git/cpp/mysql-8.0.30/build/runtime_output_directory/merge_large_tests-t")
set_tests_properties(merge_large_tests PROPERTIES  _BACKTRACE_TRIPLES "/Users/dingrui/Code/Git/cpp/mysql-8.0.30/cmake/mysql_add_executable.cmake;176;ADD_TEST;/Users/dingrui/Code/Git/cpp/mysql-8.0.30/unittest/gunit/CMakeLists.txt;370;MYSQL_ADD_EXECUTABLE;/Users/dingrui/Code/Git/cpp/mysql-8.0.30/unittest/gunit/CMakeLists.txt;0;")
add_test(rpl_channel_credentials "/Users/dingrui/Code/Git/cpp/mysql-8.0.30/~/Code/Git/cpp/mysql-8.0.30/build/runtime_output_directory/rpl_channel_credentials-t")
set_tests_properties(rpl_channel_credentials PROPERTIES  _BACKTRACE_TRIPLES "/Users/dingrui/Code/Git/cpp/mysql-8.0.30/cmake/mysql_add_executable.cmake;176;ADD_TEST;/Users/dingrui/Code/Git/cpp/mysql-8.0.30/unittest/gunit/CMakeLists.txt;419;MYSQL_ADD_EXECUTABLE;/Users/dingrui/Code/Git/cpp/mysql-8.0.30/unittest/gunit/CMakeLists.txt;0;")
add_test(rpl_commit_order_queue "/Users/dingrui/Code/Git/cpp/mysql-8.0.30/~/Code/Git/cpp/mysql-8.0.30/build/runtime_output_directory/rpl_commit_order_queue-t")
set_tests_properties(rpl_commit_order_queue PROPERTIES  _BACKTRACE_TRIPLES "/Users/dingrui/Code/Git/cpp/mysql-8.0.30/cmake/mysql_add_executable.cmake;176;ADD_TEST;/Users/dingrui/Code/Git/cpp/mysql-8.0.30/unittest/gunit/CMakeLists.txt;429;MYSQL_ADD_EXECUTABLE;/Users/dingrui/Code/Git/cpp/mysql-8.0.30/unittest/gunit/CMakeLists.txt;0;")
subdirs("ddl_rewriter")
subdirs("innodb")
subdirs("keyring")
subdirs("components/mysql_server")
subdirs("components/keyring_common")
subdirs("xplugin")
subdirs("group_replication")
subdirs("libmysqlgcs")
subdirs("temptable")
subdirs("binlogevents")
subdirs("memory")
subdirs("containers")
subdirs("locks")
subdirs("changestreams")
