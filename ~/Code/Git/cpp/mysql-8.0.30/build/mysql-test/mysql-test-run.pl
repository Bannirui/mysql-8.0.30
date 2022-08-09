#!/usr/bin/perl
# Call mtr in out-of-source build
$ENV{MTR_BINDIR} = '/Users/dingrui/Code/Git/cpp/mysql-8.0.30/~/Code/Git/cpp/mysql-8.0.30/build';
chdir('/Users/dingrui/Code/Git/cpp/mysql-8.0.30/mysql-test');
exit(system($^X, '/Users/dingrui/Code/Git/cpp/mysql-8.0.30/mysql-test/mysql-test-run.pl', @ARGV) >> 8);
