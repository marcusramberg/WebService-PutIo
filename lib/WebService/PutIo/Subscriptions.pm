package WebService::PutIo::Subscriptions;

use base 'WebService::PutIo';

my $class='subscriptions';

sub list { shift->request($class,'list',@_); }
sub create { shift->request($class,'create',@_); }
sub edit { shift->request($class,'edit',@_); }
sub delete { shift->request($class,'delete',@_); }
sub pause { shift->request($class,'pause',@_); }
sub info { shift->request($class,'info',@_); }

=head1 NAME

WebService::PutIo::Subscriptions - Manage RSS Subscriptions

=head1 SYNOPSIS

    use WebService::PutIo::Subscriptions;
	my $subs=WebService::PutIo::Subscriptions->new(api_key=>'..',api_secret=>'..');
	my $res=$subs->list;
	foreach my $sub (@{$res->results}) {
	   print "Got ". Data::Dumper($sub);
	}

=head1 DESCRIPTION

Methods to manage RSS subscriptions on put.io

=head1 METHODS

=head2 list

=head2 create

=head2 edit

=head2 delete

=head2 pause

=head2 info

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2010, Marcus Ramberg.

This program is free software, you can redistribute it and/or modify it under
the terms of the Artistic License version 2.0.

=cut

1;