use utf8;
package DJKMitglieder::Schema::Result::MitgliedAbteilung;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DJKMitglieder::Schema::Result::MitgliedAbteilung

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::TimeStamp>

=item * L<DBIx::Class::PassphraseColumn>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp", "PassphraseColumn");

=head1 TABLE: C<Mitglied_Abteilung>

=cut

__PACKAGE__->table("Mitglied_Abteilung");

=head1 ACCESSORS

=head2 mid

  data_type: 'integer'
  is_nullable: 0

=head2 aid

  data_type: 'integer'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "mid",
  { data_type => "integer", is_nullable => 0 },
  "aid",
  { data_type => "integer", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</mid>

=item * L</aid>

=back

=cut

__PACKAGE__->set_primary_key("mid", "aid");


# Created by DBIx::Class::Schema::Loader v0.07018 @ 2012-03-30 16:32:11
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:jNUkybSrZebnj64WolP70g


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
