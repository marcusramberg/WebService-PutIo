package WebService::PutIo;

our $VERSION='0.01';

use base 'Mojo::Base';

use Mojo::Client;
use Mojo::JSON;
use Mojo::URL;
use WebService::PutIo::Result;
use Carp qw/croak/;

__PACKAGE__->attr([qw/api_key api_secret/]);
__PACKAGE__->attr(client => sub { Mojo::Client->new; });
__PACKAGE__->attr(json => sub { Mojo::JSON->new; });

sub request {
	my ($self,$class,$method,%params)=@_;
	croak "Must set api_key and api_secret" unless $self->api_key && $self->api_secret;
	$params ||= ();
	my $data={
		api_key    => $self->api_key,
		api_secret => $self->api_secret,
		params	   => \%params
	};
	my $url=Mojo::URL->new('http://api.put.io/')
				     ->path("/v1/$class/$method")
				     ->query(method=>$method);
	warn("result: $url");
	my $tx=$self->client->post_form( $url => { request => $self->json->encode($data) } );
	if (my $res=$tx->success) {
		return WebService::PutIo::Result->new( response => $res );
	}
	else {
		my ($message,$code)=$tx->error;
		die "Request failed($code): $message";
	}
}

1;

=head1 NAME

WebService::PutIo - WebService client for the put.io API

=head1 SYNOPSIS

    use WebService::PutIo;

=cut