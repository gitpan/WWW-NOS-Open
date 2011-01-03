# $Id: 02_exceptions.t 393 2011-01-03 20:59:03Z roland $
# $Revision: 393 $
# $HeadURL: svn+ssh://ipenburg.xs4all.nl/srv/svnroot/candi/trunk/WWW-NOS-Open/t/02_exceptions.t $
# $Date: 2011-01-03 21:59:03 +0100 (Mon, 03 Jan 2011) $

use strict;
use warnings;

use Test::More tests => 2 + 2;
use Test::NoWarnings;
use WWW::NOS::Open;

my $API_KEY         = $ENV{NOSOPEN_API_KEY} || q{TEST};
my $INVALID_API_KEY = q{INVALID};
my $MINUTE          = 60;

my $obj = WWW::NOS::Open->new($API_KEY);
my $e;
eval { $obj->get_version; };
$e = Exception::Class->caught('NOSOpenInternalServerErrorException')
  || Exception::Class->caught('NOSOpenUnauthorizedException');

TODO: {
    todo_skip
q{Dummy server doesn't support custom content in exception response. Need a connection to the NOS Open server. Set the enviroment variable NOSOPEN_API_KEY to connect.},
      2
      if $e
          || ( $ENV{NOSOPEN_SERVER}
              && ( $ENV{NOSOPEN_SERVER} ne q{http://open.nos.nl} ) );

    # Try to trigger a bad request should not be possible using this framework?
    #$e = Exception::Class->caught('NOSOpenBadRequestException');
    #is( $e->error->{ shift @{ [ keys %{ $e->error } ] } }->{error}->{code},
    #    111, q{throwing BAD REQUEST error} );

    $obj->set_api_key($INVALID_API_KEY);
    eval { $obj->get_version; };
    $e = Exception::Class->caught('NOSOpenUnauthorizedException');
    is( $e->error->{ shift @{ [ keys %{ $e->error } ] } }->{error}->{code},
        201, q{throwing UNAUTHORIZED error} );

    $obj->set_api_key($API_KEY);
    my $request = 0;
    $e = undef;
    while ( !defined $e ) {
        diag( q{Pushing rate to limit } . $request++ );
        eval { $obj->get_version; };
        $e = Exception::Class->caught('NOSOpenForbiddenException');
    }
    is( $e->error->{ shift @{ [ keys %{ $e->error } ] } }->{error}->{code},
        302, q{throwing FORBIDDEN error} );
    diag(qq{Waiting $MINUTE seconds for rate to recover...});
    sleep $MINUTE;
}

my $msg = 'Author test. Set $ENV{TEST_AUTHOR} to a true value to run.';
SKIP: {
    skip $msg, 1 unless $ENV{TEST_AUTHOR};
}
$ENV{TEST_AUTHOR} && Test::NoWarnings::had_no_warnings();
