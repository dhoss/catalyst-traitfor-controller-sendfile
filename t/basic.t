use strict;
use warnings;
use Test::More;
use HTTP::Request::Common;

use FindBin;
use lib "$FindBin::Bin/lib";
use Path::Class;

use Catalyst::Test 'TestApp';

{
    my $response = request(GET '/');
    ok( $response, 'Request' );
    ok( $response->is_success, 'Response Successful 2xx' );
    is( $response->header( 'X-Sendfile' ), Path::Class::File->new("$FindBin::Bin/lib/image.png"), 'Sendfile Header' );
    is( $response->header( 'Content-Type' ), 'image/png', 'Content Type' );
    is( $response->header( 'Content-Length' ), 81, 'Content Length' );
}

done_testing;

