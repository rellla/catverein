use utf8;
package DJKMitglieder::Schema::Result::Beitrag;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DJKMitglieder::Schema::Result::Beitrag

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

=head1 TABLE: C<Beitrag>

=cut

__PACKAGE__->table("Beitrag");

=head1 ACCESSORS

=head2 bid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 betrag

  data_type: 'integer'
  is_nullable: 0

=head2 bemerkung

  data_type: 'varchar'
  is_nullable: 0
  size: 50

=cut

__PACKAGE__->add_columns(
  "bid",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "betrag",
  { data_type => "integer", is_nullable => 0 },
  "bemerkung",
  { data_type => "varchar", is_nullable => 0, size => 50 },
);

=head1 PRIMARY KEY

=over 4

=item * L</bid>

=back

=cut

__PACKAGE__->set_primary_key("bid");


# Created by DBIx::Class::Schema::Loader v0.07018 @ 2012-03-30 16:32:11
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:dD+/99xq2APRa+G+LM3rjA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
