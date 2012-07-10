package DJKMitglieder::Controller::Login;
use Moose;
use namespace::autoclean;
BEGIN {extends 'Catalyst::Controller::ActionRole'; }

=head1 NAME

DJKMitglieder::Controller::Login - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

Login logic

=cut

#sub index :Path :Args(0) Does('RequireSSL') {
sub index :Path :Args(0) {
    my ( $self, $c ) = @_;
    my $username = $c->request->params->{username};
    my $password = $c->request->params->{password};
    
    if ($username && $password) {
	if ($c->authenticate({ username => $username,
			    password => $password  } )) {
	    $c->response->redirect($c->uri_for(
		$c->controller('Root')->action_for('index')));
	    return;
	} else {
	    $c->stash(error_msg => "Falscher Benutzername oder Passwort.");
	}
    } else {
	$c->stash(error_msg => "Leerer Benutzername oder Passwort.")
	    unless ($c->user_exists);
    }
    $c->stash(template => 'login.tt2');
}


=head1 AUTHOR

root

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
