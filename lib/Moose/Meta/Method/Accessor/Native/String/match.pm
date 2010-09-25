package Moose::Meta::Method::Accessor::Native::String::match;

use strict;
use warnings;

our $VERSION = '1.14';
$VERSION = eval $VERSION;
our $AUTHORITY = 'cpan:STEVAN';

use base 'Moose::Meta::Method::Accessor::Native::Reader';

sub _minimum_arguments { 1 }
sub _maximum_arguments { 1 }

sub _inline_check_arguments {
    my $self = shift;

    return $self->_inline_throw_error(
        q{'The argument passed to match must be a string or regexp reference'}
    ) . q{ unless ! ref $_[0] || ref $_[0] eq 'Regexp';};
}

sub _return_value {
    my ( $self, $slot_access ) = @_;

    return "$slot_access =~ \$_[0]";
}

1;