use strict;
use warnings;

use DJKMitglieder;

my $app = DJKMitglieder->apply_default_middlewares(DJKMitglieder->psgi_app);
$app;

