use strict;
use warnings;
use Test::More;


use Catalyst::Test 'DJKMitglieder';
use DJKMitglieder::Controller::Mitglieder;

ok( request('/mitglieder')->is_success, 'Request should succeed' );
done_testing();
