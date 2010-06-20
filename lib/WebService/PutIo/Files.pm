package WebService::PutIo::Files;

use base 'WebService::PutIo';

my $class='files';

sub list { shift->request($class,'list',@_); }
sub create_dir { shift->request($class,'create_dir',@_); }
sub info { shift->request($class,'info',@_); }
sub rename { shift->request($class,'rename',@_); }
sub move { shift->request($class,'move',@_); }
sub delete { shift->request($class,'delete',@_); }
sub search { shift->request($class,'search',@_); }
sub dirmap { shift->request($class,'dirmap',@_); }

=head1 NAME

WebService::PutIo::Files - File Operations for put.io

=head1 SYNOPSIS

    use WebService::PutIo::Files;
	my $files=WebService::PutIo::Files->new(api_key=>'..',api_secret=>'..');
	my $res=$files->list;
	foreach my $file (@{$res->results}) {
	   print "Got ". Data::Dumper($file);
	}

=head1 DESCRIPTION

File related methods for the put.io web service

=head1 METHODS 

=head2 list

=head2 create_dir

=head2 info

=head2 rename

=head2 move

=head2 delete

=head2 search

=head2 dirmap

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2010, Marcus Ramberg.

This program is free software, you can redistribute it and/or modify it under
the terms of the Artistic License version 2.0.

=cut

1;