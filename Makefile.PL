#!/usr/bin/env perl

use 5.008001;

use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
    NAME         => 'Net::PutIo',
    VERSION_FROM => 'lib/Net/PutIo.pm',
    AUTHOR       => 'Marcus Ramberg <mramberg@cpan.org>',
    PREREQ_PM => { 'Mojo' => '0.9003' },
    test => {TESTS => 't/*.t t/*/*.t t/*/*/*.t'}
);
