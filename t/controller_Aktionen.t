use strict;
use warnings;
use Test::More;


use Catalyst::Test 'DJKMitglieder';
use DJKMitglieder::Controller::Aktionen;

ok( request('/aktionen')->is_success, 'Request should succeed' );
done_testing();
