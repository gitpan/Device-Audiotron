# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use Test;
BEGIN { plan tests => 2 };
use Device::Audiotron;

ok(1); # If we made it this far, we're ok.

#########################

# Insert your test code below, the Test module is used here so read
# its man page ( perldoc Test ) for help writing this test script.

print "This test calls GlobalInfo and upon success displays the Audiotron's firmware version\n\n";

print "\nAudiotron's IP address: ";
my $ip = <STDIN>;
chomp($ip);

print "\nAudiotron's Username: ";
my $user = <STDIN>;
chomp($user);

print "\nAudiotron's Password: ";
my $pass = <STDIN>;
chomp($pass);

print "\n\nTesting...\n\n";

my $at = new Device::Audiotron($ip,$user,$pass);
if(!$at){ok(0);}

my ($ref_status, $ref_shares, $ref_hosts) = $at->GlobalInfo();
my $firmware_version = $ref_status->{"Version"};

print "\n\nFirmware Version: " . $firmware_version . "\n\n";

