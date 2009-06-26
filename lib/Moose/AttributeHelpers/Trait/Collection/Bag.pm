
package Moose::AttributeHelpers::Trait::Collection::Bag;
use Moose::Role;
use Moose::Util::TypeConstraints;

our $VERSION   = '0.85';
$VERSION = eval $VERSION;
our $AUTHORITY = 'cpan:STEVAN';

use Moose::AttributeHelpers::MethodProvider::Bag;

with 'Moose::AttributeHelpers::Trait::Collection';

has 'method_provider' => (
    is        => 'ro',
    isa       => 'ClassName',
    predicate => 'has_method_provider',
    default   => 'Moose::AttributeHelpers::MethodProvider::Bag'
);

subtype 'Bag' => as 'HashRef[Int]';

sub _helper_type { 'Bag' }

sub _default_default { sub { {} } }

no Moose::Role;
no Moose::Util::TypeConstraints;

# register the alias ...
package # hide me from search.cpan.org
    Moose::Meta::Attribute::Custom::Trait::Collection::Bag;
sub register_implementation {
    'Moose::AttributeHelpers::Trait::Collection::Bag'
}

1;

__END__

=pod

=head1 NAME

Moose::AttributeHelpers::Collection::Bag

=head1 SYNOPSIS

  package Stuff;
  use Moose;
  use Moose::AttributeHelpers;

  has 'word_histogram' => (
      metaclass => 'Collection::Bag',
      is        => 'ro',
      isa       => 'Bag', # optional ... as is defalt
      handles   => {
          add_word      => 'add',
          get_count_for => 'get',
          has_any_words => 'empty',
          num_words     => 'count',
          delete_word   => 'delete',
      }
  );

=head1 DESCRIPTION

This module provides a Bag attribute which provides a number of
bag-like operations. See L<Moose::AttributeHelpers::MethodProvider::Bag>
for more details.

=head1 METHODS

=over 4

=item B<meta>

=item B<method_provider>

=item B<has_method_provider>

=back

=head1 BUGS

All complex software has bugs lurking in it, and this module is no
exception. If you find a bug please either email me, or add the bug
to cpan-RT.

=head1 AUTHOR

Stevan Little E<lt>stevan@iinteractive.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright 2007-2009 by Infinity Interactive, Inc.

L<http://www.iinteractive.com>

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut