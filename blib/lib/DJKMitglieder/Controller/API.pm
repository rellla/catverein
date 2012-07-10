package DJKMitglieder::Controller::API;
use Moose;
use namespace::autoclean;
use strict;
use warnings;

BEGIN {extends 'Catalyst::Controller::REST'; }

__PACKAGE__->config(default => 'application/json');

=head1 NAME

DJKMitglieder::Controller::API - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub grid : Local ActionClass('REST') {}
 
sub grid_POST {
    my ($self, $c) = @_;
 
    my ($page, $search_by, $search_text, $rows, $sort_by, $sort_order) =
        @{ $c->req->params }{qw/page qtype query rp sortname sortorder/};
 
    s/\W*(\w+).*/$1/ for $sort_by, $sort_order, $search_by; # sql injections bad
 
    my %data;
 
    my $rs = $c->model('DB::Mitglied')->search({}, {
        order_by => "$sort_by $sort_order",
    });
 
    $rs = $rs->search_literal("lower($search_by) LIKE ?", lc($search_text))
        if $search_by && $search_text;
 
    my $paged_rs = $rs->search({}, {
        page => $page,
        rows => $rows,
    });
 
    $data{total} = $rs->count;
    $data{page}  = $page;
    $data{rows}  = [
        map { +{ 
			id => $_->mid,
            cell => [
                $_->mid,
                $_->nachname,
                $_->vorname,
                $_->strasse,
                $_->hausnummer,
                $_->ort,
				$_->geburtstag->dmy('.'),
			]
        } } $paged_rs->all
	];
    $self->status_ok($c, entity => \%data);
}


=head1 AUTHOR

root

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
