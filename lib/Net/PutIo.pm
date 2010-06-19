package Net::PutIo;

our $VERSION='0.01';

use base 'Mojo::Base';

use Mojo::Client;
use Mojo::JSON;
use Mojo::URI;
use Net::PutIo::Result;
use Carp::Croak;

__PACKAGE__->attr(qw/api_key api_secret/);
__PACKAGE__->attr(client => sub { Mojo::Client->new; });
__PACKAGE__->attr(json => sub { Mojo::JSON->new; });

sub request {
	my ($self,$class,$method,%params)=@_;
	croak "Must set api_key and api_secret" unless $self->api_key && $self->api_secret;
	my $data={
		api_key    => $self->api_key,
		api_secret => $self->api_secret,
		params	   => \%params
	};
	my $uri=Mojo::URI->new(base=>'http://api.put.io/v1/')
				     ->fragment($method)
				     ->query(method=>$method);
	my $tx=$self->client->post_form( $uri => $data );
	if (my $res=$tx->success) {
		return Mojo::PutIo::Result->new( res=> { request => $self->json->encode($data) } );
	}
	else {
		my ($message,$code)=$tx->error;
		die "Request failed($code): $message";
	}
}

1;