package DJKMitglieder::Controller::Root;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config(namespace => '');

=head1 NAME

DJKMitglieder::Controller::Root - Root Controller for DJKMitglieder

=head1 DESCRIPTION

This is the Root Controller for the DJKMitglieder Application.

=head1 METHODS

=head2 auto

Check Page

=cut

sub auto :Private {
    my ( $self, $c ) = @_;
    if ($c->controller eq $c->controller('Login')) {
	return 1;
    }
    if (!$c->user_exists) {
	$c->log->debug('***Root::auto User not found, forwarding to /login');
	$c->response->redirect($c->uri_for('/login'));
	return 0;
    }
    return 1;
}

=head2 index

The root page (/)

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;
    $c->stash(template => 'startseite.tt2');
}

=head2 default

Standard 404 error page

=cut

sub default :Path {
    my ( $self, $c ) = @_;
    $c->response->body( 'Page not found' );
    $c->response->status(404);
}

=head2 end

Attempt to render a view, if needed.

=cut

sub end : ActionClass('RenderView') {
	my ( $self, $c ) = @_;
	$c->load_status_msgs;
	$c->response->content_type('text/html; charset=iso-8859-1');
}

=head1 AUTHOR

root

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
