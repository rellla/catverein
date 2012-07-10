package DJKMitglieder::Controller::Mitglied;
use Moose;
use namespace::autoclean;

BEGIN {extends 'Catalyst::Controller::HTML::FormFu'; }

=head1 NAME

DJKMitglieder::Controller::Mitglied - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

Default Methode aufrufen: list

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;
	$c->detach('list');
}

=head2 list

Alle Mitglieder in einer Tabelle anzeigen. Sortierbar, filterbar, durchsuchbar.

=cut

sub list :Local {
    my ($self, $c) = @_;
	$c->stash(template => 'mitglied/list.tt2');
}

=head2 show

Karteikarte eines Mitglieds anzeigen.

=cut

sub show :Local {
    my ($self, $c, $id) = @_;
	$c->stash(
		mitglieder => [$c->model('DB::Mitglied')->search({
			mid => $id }),
		]
    );
}

=head2 edit
    
Benutze HTML::FormFu um ein bestehendes Mitglied zu ändern.

=cut

sub edit :Local :Args(1) :FormConfig('mitglied/add.yml') {
	my ($self, $c, $mid) = @_;
	my $mitglied = $c->model('DB::Mitglied')->find($mid);
	unless ($mitglied) {
		$c->response->redirect($c->uri_for($self->action_for('list'),
					{mid => $c->set_error_msg("Ändern nicht möglich.")}));
		$c->detach;
	}
	my $form = $c->stash->{form};
	$c->stash(nameid => $mitglied->mid." - ".$mitglied->vorname." ".$mitglied->nachname);
	if ($form->submitted_and_valid) {
		$form->model->update($mitglied);
		$c->response->redirect($c->uri_for($self->action_for('list'),
			{mid => $c->set_status_msg("Mitglied erforlgreich geändert.")}));
		$c->detach;
	} else {
		$form->model->default_values($mitglied);
	}
	$c->stash(no_wrapper => 1);
	$c->stash(template => 'mitglied/add.tt2');
}

=head2 add

Benutze HTML::FormFu um ein neues Mitglied hinzu zu fügen.

=cut

sub add :Local :Args(0) :FormConfig {
	my ($self, $c) = @_;
	my $form = $c->stash->{form};
	$c->stash(nameid => "Neues Mitglied");
	if ($form->submitted_and_valid) {
		my $mitglied = $c->model('DB::Mitglied')->new_result({});
		$form->model->update($mitglied);
		$c->response->redirect($c->uri_for($self->action_for('list'),
                {mid => $c->set_status_msg("Mitglied '".$mitglied->vorname." ".$mitglied->nachname." erforglreich hinzugefügt.")}));
		$c->detach;
		} else {
	}
	$c->stash(no_wrapper => 1);
	$c->stash(template => 'mitglied/add.tt2');
}

=head2 delete

Mitglied löschen.

=cut

sub delete :Local :Args(1) {
	my ($self, $c, $mid) = @_;
	if ($mid) {
		my $mitglied = $c->model('DB::Mitglied')->find($mid);
		my $deleted = $mitglied->delete;
		$c->response->redirect($c->uri_for($self->action_for('list'),
               {mid => $c->set_status_msg("Mitglied gelöscht.")}));
	} else {
		$c->response->redirect($c->uri_for($self->action_for('list'),
               {mid => $c->set_status_msg("Mitglied nicht gelöscht.")}));
	}
}

=head1 AUTHOR

root

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
