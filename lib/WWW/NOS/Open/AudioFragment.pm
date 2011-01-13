package WWW::NOS::Open::AudioFragment;    # -*- cperl; cperl-indent-level: 4 -*-
use strict;
use warnings;

# $Id: AudioFragment.pm 414 2011-01-13 22:43:18Z roland $
# $Revision: 414 $
# $HeadURL: svn+ssh://ipenburg.xs4all.nl/srv/svnroot/candi/trunk/WWW-NOS-Open/lib/WWW/NOS/Open/AudioFragment.pm $
# $Date: 2011-01-13 23:43:18 +0100 (Thu, 13 Jan 2011) $

use utf8;
use 5.006000;

our $VERSION = '0.02';

use Moose qw/extends/;
use namespace::autoclean -also => qr/^__/sxm;

extends 'WWW::NOS::Open::MediaResource';

no Moose;

## no critic qw(RequireExplicitInclusion)
__PACKAGE__->meta->make_immutable;
## use critic

1;

__END__

=encoding utf8

=for stopwords Roland van Ipenburg API NOS DateTime URI AudioFragment URL HTML

=head1 NAME

WWW::NOS::Open::AudioFragment - Class representing a client side audio
fragment in the L<Open NOS|http://open.nos.nl/> REST API.

=head1 VERSION

This document describes WWW::NOS::Open::AudioFragment version 0.02.

=head1 SYNOPSIS

    use WWW::NOS::Open::AudioFragment;

=head1 DESCRIPTION

This class represents an audio fragment as returned in the latest ten audio
fragments list.

=head1 SUBROUTINES/METHODS

=head2 C<new>

Create a new audio fragment object.

=over

=item 1. A hash containing the properties and their values.

=back

=head2 C<get_id>

Returns the id of the audio fragment as integer.

=head2 C<get_title>

Returns the title of the audio fragment as string.

=head2 C<get_description>

Returns the description of the audio fragment as string.

=head2 C<get_published>

Returns the publishing date of the audio fragment as a L<DateTime|DateTime>
object.

=head2 C<get_last_update>

Returns the date of the last update for the audio fragment as a
L<DateTime|DateTime> object.

=head2 C<get_thumbnail_xs>

Returns the URL of the extra small thumbnail for the audio fragment as an
L<URI|URI> object.

=head2 C<get_thumbnail_s>

Returns the URL of the small thumbnail for the audio fragment as an L<URI|URI>
object.

=head2 C<get_thumbnail_m>

Returns the URL of the medium sized thumbnail for the audio fragment as an
L<URI|URI> object.

=head2 C<get_link>

Returns the URL of the main audio fragment as an L<URI|URI> object. 

=head2 C<get_embed_code>

Return the HTML code to embed the audio fragment in an HTML page.

=head2 C<get_keywords>

Returns the list of keywords for the audio fragment as a reference to an array
of strings.

=head1 CONFIGURATION AND ENVIRONMENT

=head1 DEPENDENCIES

L<Moose|Moose>
L<namespace::autoclean|namespace::autoclean>
L<WWW::NOS::Open::MediaResource|WWW::NOS::Open::MediaResource>

=head1 INCOMPATIBILITIES

=head1 DIAGNOSTICS

=head1 BUGS AND LIMITATIONS

Please report any bugs or feature requests at
L<RT for rt.cpan.org|https://rt.cpan.org/Dist/Display.html?Queue=WWW-NOS-Open>.

=head1 AUTHOR

Roland van Ipenburg  C<< <ipenburg@xs4all.nl> >>

=head1 LICENSE AND COPYRIGHT

Copyright 2011 by Roland van Ipenburg

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.12.2 or,
at your option, any later version of Perl 5 you may have available.

=head1 DISCLAIMER OF WARRANTY

BECAUSE THIS SOFTWARE IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
FOR THE SOFTWARE, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN
OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
PROVIDE THE SOFTWARE "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER
EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE
ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE SOFTWARE IS WITH
YOU. SHOULD THE SOFTWARE PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL
NECESSARY SERVICING, REPAIR, OR CORRECTION.

IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
REDISTRIBUTE THE SOFTWARE AS PERMITTED BY THE ABOVE LICENSE, BE
LIABLE TO YOU FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL,
OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE
THE SOFTWARE (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING
RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A
FAILURE OF THE SOFTWARE TO OPERATE WITH ANY OTHER SOFTWARE), EVEN IF
SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF
SUCH DAMAGES.

=cut
