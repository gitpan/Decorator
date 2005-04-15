#!/usr/bin/perl -w

# Main testing for Decorator

use strict;
use lib ();
use UNIVERSAL 'isa';
use File::Spec::Functions ':ALL';
BEGIN {
	$| = 1;
	unless ( $ENV{HARNESS_ACTIVE} ) {
		require FindBin;
		chdir ($FindBin::Bin = $FindBin::Bin); # Avoid a warning
		lib->import( catdir( updir(), updir(), 'modules') );
	}
}

use Test::More tests => 13;
use Scalar::Util 'refaddr';
use Decorator ();

# Create an object
my $object = bless {}, 'Foo';
isa_ok( $object, 'Foo' );

# Create a decorator
my $decorator = Decorator->new( $object );
isa_ok( $decorator, 'Decorator' );

# Do bad things to the constructor
is( Decorator->new(), undef, 'Decorator->new() returns undef' );
my @evil = ( undef, '', 1, 'foo', \"foo", [], {}, (sub { 1 }) );
foreach my $it ( @evil ) {
	is( Decorator->new( $it ), undef, 'Decorator->new(evil) returns undef' );
}

# Can we get access to the underlying object?
isa_ok( $decorator->__OBJECT, 'Foo' );
is( refaddr($object), refaddr($decorator->__OBJECT),
	'->__OBJECT returns the original object' );

exit(0);
