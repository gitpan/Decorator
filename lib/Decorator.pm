package Decorator;

=pod

=head1 NAME

Decorator - Abstract base class for Decorator classes and objects

=head1 DESCRIPTION

The C<Decorator> class is intended as an abstract base class for creating
any sort of class or object that follows the Decorator pattern

It is also indended to serve as the base of a new namespace that will hold
a variety of different Decorator-related toolkits and factory modules. In
my opinion there is too much potential for variety to just shove all the
different modules under Class:: somewhere.

The C<Decorator> class itself supplies only two methods, a default
constructor and a private method to access the underlying object.

=head2 What can I do with Decorator

Well actually... nothing.

The base C<Decorator> class doesn't even implement a way to push method
calls through to the underlying object, since the way in which THAT
happens is the bit that changes from case to case.

To actually DO something, you probably want to go take a look at
L<Decorator::Factory>. Which should exist soon... :)

=head1 METHODS

=cut

use strict;
use Carp         ();
use Scalar::Util ();

use vars qw{$VERSION};
BEGIN {
	$VERSION = '0.01';
}





#####################################################################
# Constructor

=pod

=head2 new $object

The default C<new> constructor takes a single object as argument and
creates a new object which holds the passed object.

Returns a new C<Decorator> object (but far more likely a sub-class),
or C<undef> if you do not pass a blessed object parameter.

=cut

sub new {
	my $class  = ref $_[0] ? ref shift : shift;
	my $object = Scalar::Util::blessed($_[0]) ? shift : return undef;

	# Create the Decorator object
	my $self = bless {
		OBJECT => $object,
		}, $class;

	$self;
}





#####################################################################
# Private Methods

=pod

=head2 __OBJECT

The C<__OBJECT> method is provided primarily as a convenience, and a tool
for people implementing sub-classes, and allows the C<Decorator>
interface to provide a guarenteed correct way of getting to the underlying
object, should you need to do so.

=cut

sub __OBJECT {
	return $_[0]->{OBJECT} if ref $_[0];
	Carp::croak("Decorator::__OBJECT called as a static method");
}

1;

=pod

=head1 BUGS

It's early day yet, so you should expect C<Decorator> will change a bit.

=head1 SUPPORT

Bugs should be reported via the CPAN bug tracker at

L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Decorator>

For other issues, contact the author.

=head1 TO DO

- Write Decorator::Factory

- Write some basic standard Decorator base classes for the main ways in
which Decorators are used.

=head1 AUTHOR

Adam Kennedy (Maintainer), L<http://ali.as/>, cpan@ali.as

=head1 SEE ALSO

L<Class::Decorator>, L<Decorator::Factory>

=head1 COPYRIGHT

Copyright 2005 Adam Kennedy. All rights reserved.
This program is free software; you can redistribute
it and/or modify it under the same terms as Perl itself.

The full text of the license can be found in the
LICENSE file included with this module.

=cut
