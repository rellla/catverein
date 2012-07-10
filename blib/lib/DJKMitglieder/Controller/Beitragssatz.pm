package DJKMitglieder::Controller::Beitragssatz;
use Moose;
use namespace::autoclean;

BEGIN {extends 'Catalyst::Controller::HTML::FormFu'; }

=head1 NAME

DJKMitglieder::Controller::Beitragssatz - Catalyst Controller

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

Alle Beiträge in einer Tabelle anzeigen.

=cut

sub list :Local :Args(0) {
    my ($self, $c) = @_;
	$c->stash(beitraege => [$c->model('DB::Beitrag')->all]);
	$c->stash(template => 'beitragssatz/list.tt2');
}

=head2 delete

Beitragssatz löschen.

=cut

sub delete :Local :Args(1) {
	my ($self, $c, $bid) = @_;
	if ($bid) {
		my $beitrag = $c->model('DB::beitrag')->find($bid);
		my $deleted = $beitrag->delete;
		$c->response->redirect($c->uri_for($self->action_for('list'),
               {mid => $c->set_status_msg("Beitrag gelöscht.")}));
	} else {
		$c->response->redirect($c->uri_for($self->action_for('list'),
               {mid => $c->set_status_msg("Beitrag nicht gelöscht.")}));
	}
}

=head2 edit
    
Benutze HTML::FormFu um einen bestehenden Beitrag zu ändern.

=cut

sub edit :Local :Args(1) :FormConfig('beitragssatz/add.yml') {
	my ($self, $c, $bid) = @_;
	my $beitrag = $c->model('DB::beitrag')->find($bid);
	unless ($beitrag) {
		$c->response->redirect($c->uri_for($self->action_for('list'),
					{mid => $c->set_error_msg("Falscher Beitrag -- Ändern nicht möglich.")}));
		$c->detach;
	}
	my $form = $c->stash->{form};
	if ($form->submitted_and_valid) {
		$form->model->update($beitrag);
		$c->response->redirect($c->uri_for($self->action_for('list'),
			{mid => $c->set_status_msg("Beitrag geändert.")}));
		$c->detach;
	} else {
		$form->model->default_values($beitrag);
	}
	$c->stash(template => 'beitragssatz/add.tt2');
}

=head2 add

Benutze HTML::FormFu um einen neuen Beitrag zu erstellen.

=cut

sub add :Local :Args(0) :FormConfig {
	my ($self, $c) = @_;
	my $form = $c->stash->{form};
	if ($form->submitted_and_valid) {
		my $beitrag = $c->model('DB::beitrag')->new_result({});
		$form->model->update($beitrag);
		$c->response->redirect($c->uri_for($self->action_for('list'),
                {mid => $c->set_status_msg("Beitrag '".$beitrag->bemerkung."' in einer Höhe von '".$beitrag->betrag." €' erforglreich hinzugefügt.")}));
		$c->detach;
		} else {
	}
	$c->stash(template => 'beitragssatz/add.tt2');
}


=head1 AUTHOR

root

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
