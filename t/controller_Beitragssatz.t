use strict;
use warnings;
use Test::More;


use Catalyst::Test 'DJKMitglieder';
use DJKMitglieder::Controller::Beitragssatz;

ok( request('/beitragssatz')->is_success, 'Request should succeed' );
done_testing();
