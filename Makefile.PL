use inc::Module::Install;

name           ( 'Decorator'                 );
abstract       ( 'Abstract base class for Decorator classes' );
author         ( 'Adam Kennedy<adam@ali.as>' );
version_from   ( 'lib/Decorator.pm'          );

requires       ( 'perl'           => '5.005' );
requires       ( 'Scalar::Util'   => '1.11'  );

requires       ( 'File::Spec'     => '0.82'  );
build_requires ( 'Test::More'     => '0.47'  );

auto_install();

&WriteAll;
