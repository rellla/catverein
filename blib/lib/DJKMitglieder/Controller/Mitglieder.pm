package DJKMitglieder::Controller::Mitglieder;
use Moose;
use namespace::autoclean;

BEGIN {extends 'Catalyst::Controller'; }

=head1 NAME

DJKMitglieder::Controller::Mitglieder - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->response->body('Matched DJKMitglieder::Controller::Mitglieder in Mitglieder.');
}

=head2 list

Fetch all Mitglieder

=cut


sub list :Local {
    my ($self, $c) = @_;
    $c->stash(mitglieder => [$c->model('DB::Mitglied')->all]);
    $c->stash(template => 'mitglieder/list.tt2');
}

=head1 AUTHOR

root

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
