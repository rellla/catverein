use utf8;
package DJKMitglieder::Schema::Result::Abteilung;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DJKMitglieder::Schema::Result::Abteilung

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

=head1 TABLE: C<Abteilung>

=cut

__PACKAGE__->table("Abteilung");

=head1 ACCESSORS

=head2 aid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 abteilung

  data_type: 'varchar'
  is_nullable: 0
  size: 30

=cut

__PACKAGE__->add_columns(
  "aid",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "abteilung",
  { data_type => "varchar", is_nullable => 0, size => 30 },
);

=head1 PRIMARY KEY

=over 4

=item * L</aid>

=back

=cut

__PACKAGE__->set_primary_key("aid");


# Created by DBIx::Class::Schema::Loader v0.07018 @ 2012-03-30 16:32:11
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Jad8srydCXoTpiwbDx0azA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
