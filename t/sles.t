use 5.006000;
use strict;
use warnings;

use Test::More tests => 2;
use lib '../lib/';
use Linux::Distribution;

local $Linux::Distribution::release_files_directory='t/sles/';
my $linux = Linux::Distribution->new;
my $distro = $linux->distribution_name();
is($distro,'sles');
my $version = $linux->distribution_version();
is ($version,'11');
