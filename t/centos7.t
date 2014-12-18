use 5.006000;
use strict;
use warnings;

use Test::More tests => 2;
use lib '../lib/';
use Linux::Distribution;

local $Linux::Distribution::release_files_directory='t/centos7/';
my $linux = Linux::Distribution->new;
my $distro = $linux->distribution_name();
is($distro,'centos');
my $version = $linux->distribution_version();
is ($version,'7.0.1406');
