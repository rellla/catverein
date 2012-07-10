#!/usr/bin/perl

use strict;
use warnings;

use DJKMitglieder::Schema;

my $schema = DJKMitglieder::Schema->connect('dbi:mysql:djkmitglieder', 'verwaltung', 'AnderKohlstatt1');

my @users = $schema->resultset('User')->all;

foreach my $user (@users) {
    $user->password('AnderKohlstatt1');
    $user->update;
}