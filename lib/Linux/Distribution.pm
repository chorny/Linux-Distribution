package Linux::Distribution;

use 5.008005;
use strict;
use warnings;
use Carp qw(carp);

require Exporter;

our @ISA = qw(Exporter);

our @EXPORT_OK = qw( distribution_name );

our $VERSION = '0.02';

our %release_files = (
    'gentoo-release'        => 'gentoo',
    'fedora-release'        => 'fedora',
    'turbolinux-release'    => 'turbolinux',
    'mandrake-release'      => 'mandrake',
    'mandrakelinux-release' => 'mandrakelinux',
    'debian_version'        => 'debian',
    'debian_release'        => 'debian',
    'SuSE-release'          => 'suse',
    'knoppix-version'       => 'knoppix',
    'yellowdog-release'     => 'yellowdog',
    'slackware-version'     => 'slackware',
    'slackware-release'     => 'slackware',
    'redhat-release'        => 'redhat',
    'redhat_version'        => 'redhat',
    'conectiva-release'     => 'conectiva',
    'immunix-release'       => 'immunix',
    'tinysofa-release'      => 'tinysofa',
    'va-release'            => 'va-linux'
);

carp('you are trying to use a linux specific module on a different OS')
  if ( $^O ne 'linux' );

sub distribution_name() {
    foreach my $test ( keys %release_files ) {
        if ( -f "/etc/$test" ) {
            return $release_files{$test};
        }
    }
    return '';
}

1;
__END__


=head1 NAME

Linux::Distribution - Perl extension to guess on what linux distribution we are running on.

=head1 SYNOPSIS

  use Linux::Distribution qw(distribution_name);

  if(my $distro = distribution_name) {
  	print "you are running $distro\n";
  } else {
  	print "distribution unknown\n";
  }

=head1 DESCRIPTION

This is a simple module that try to guess on what linux distribution we are running looking for release's files in /etc.

It currently recognize slackware, debian, suse, fedora, redhat, turbolinux, yellowdog, knoppix, mandrake, conectiva, immunix, tinysofa, va-linux and gentoo.

=head2 EXPORT

None by default.

=head1 TODO

Add the capability of recognize the version of the distribution.

=head1 AUTHOR

Re Alberto, E<lt>kerberus@accidia.netE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2005 by Re Alberto

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.5 or,
at your option, any later version of Perl 5 you may have available.

=cut

