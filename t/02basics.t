use Test::More tests=>2;

use Net::PutIo;
use Net::PutIo::Response;
my $put_io=Net::PutIo->new();
my $res=Net::PutIo::Response->new();
isa_ok($put_io,'Net::PutIo');
can_ok($put_io,qw/api_key api_secret/);
isa_ok($res,'Net::PutIo::Response');
can_ok($put_io,qw/api_key api_secret/);