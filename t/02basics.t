use Test::More tests=>4;

use Net::PutIo;
use Net::PutIo::Result;
my $put_io=Net::PutIo->new;
my $res=Net::PutIo::Result->new();
isa_ok($put_io,'Net::PutIo');
can_ok($put_io,qw/api_key api_secret/);
isa_ok($res,'Net::PutIo::Result');
can_ok($res,qw/response/);
isa_ok($put_io->client,'Mojo::Client');
isa_ok($put_io->json,'Mojo::JSON');