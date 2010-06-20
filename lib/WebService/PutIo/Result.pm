package WebService::PutIo::Result;	

use base qw/Mojo::Base/;

use Mojo::JSON;
use Carp qw/croak/;

__PACKAGE__->attr(qw/response/);
__PACKAGE__->attr('json' => sub { Mojo::JSON->new });
__PACKAGE__->attr( data => sub { my $self=shift;$self->json->decode($self->response->body) });

sub count {
	return shift->data->{response}->{total};
}

sub results {
	my $self=shift;
	if($self->data->{error}) {
		croak('API Request failed: '. $self->data->{error_message});
	}
	return $self->data->{response}->{results};
}

1;