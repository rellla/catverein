use utf8;
package DJKMitglieder::Schema::Result::Mitglied;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DJKMitglieder::Schema::Result::Mitglied

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

=head1 TABLE: C<Mitglied>

=cut

__PACKAGE__->table("Mitglied");

=head1 ACCESSORS

=head2 mid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 vorname

  data_type: 'varchar'
  is_nullable: 0
  size: 30

=head2 nachname

  data_type: 'varchar'
  is_nullable: 0
  size: 30

=head2 geburtstag

  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 status

  data_type: 'integer'
  is_nullable: 0

=head2 geschlecht

  data_type: 'integer'
  is_nullable: 0

=head2 firma

  data_type: 'integer'
  is_nullable: 0

=head2 strasse

  data_type: 'varchar'
  is_nullable: 0
  size: 30

=head2 ort

  data_type: 'varchar'
  is_nullable: 0
  size: 30

=head2 ortsteil

  data_type: 'varchar'
  is_nullable: 0
  size: 30

=head2 hausnummer

  data_type: 'integer'
  is_nullable: 0

=head2 eintritt

  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 austritt

  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 email

  data_type: 'varchar'
  is_nullable: 1
  size: 30

=head2 telefon

  data_type: 'varchar'
  is_nullable: 1
  size: 30

=head2 mobil

  data_type: 'varchar'
  is_nullable: 1
  size: 30

=head2 fax

  data_type: 'varchar'
  is_nullable: 1
  size: 30

=head2 bemerkung

  data_type: 'varchar'
  is_nullable: 1
  size: 30

=head2 kontonr

  data_type: 'varchar'
  is_nullable: 1
  size: 11

=head2 blz

  data_type: 'varchar'
  is_nullable: 1
  size: 11

=head2 kreditinstitut

  data_type: 'varchar'
  is_nullable: 1
  size: 50

=cut

__PACKAGE__->add_columns(
  "mid",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "vorname",
  { data_type => "varchar", is_nullable => 0, size => 30 },
  "nachname",
  { data_type => "varchar", is_nullable => 0, size => 30 },
  "geburtstag",
  { data_type => "date", datetime_undef_if_invalid => 1, is_nullable => 0 },
  "status",
  { data_type => "integer", is_nullable => 0 },
  "geschlecht",
  { data_type => "integer", is_nullable => 0 },
  "firma",
  { data_type => "integer", is_nullable => 0 },
  "strasse",
  { data_type => "varchar", is_nullable => 0, size => 30 },
  "ort",
  { data_type => "varchar", is_nullable => 0, size => 30 },
  "ortsteil",
  { data_type => "varchar", is_nullable => 0, size => 30 },
  "hausnummer",
  { data_type => "integer", is_nullable => 0 },
  "eintritt",
  { data_type => "date", datetime_undef_if_invalid => 1, is_nullable => 1 },
  "austritt",
  { data_type => "date", datetime_undef_if_invalid => 1, is_nullable => 1 },
  "email",
  { data_type => "varchar", is_nullable => 1, size => 30 },
  "telefon",
  { data_type => "varchar", is_nullable => 1, size => 30 },
  "mobil",
  { data_type => "varchar", is_nullable => 1, size => 30 },
  "fax",
  { data_type => "varchar", is_nullable => 1, size => 30 },
  "bemerkung",
  { data_type => "varchar", is_nullable => 1, size => 30 },
  "kontonr",
  { data_type => "varchar", is_nullable => 1, size => 11 },
  "blz",
  { data_type => "varchar", is_nullable => 1, size => 11 },
  "kreditinstitut",
  { data_type => "varchar", is_nullable => 1, size => 50 },
);

=head1 PRIMARY KEY

=over 4

=item * L</mid>

=back

=cut

__PACKAGE__->set_primary_key("mid");


# Created by DBIx::Class::Schema::Loader v0.07018 @ 2012-03-30 16:32:11
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:NJCpXX1tpLu2zYGUG++7ig


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
