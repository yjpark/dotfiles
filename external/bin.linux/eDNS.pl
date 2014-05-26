#!/usr/bin/perl -w
#
#  see usage() or run eDNS.pl with no command line
#  for usage information
#

use strict;
use vars qw($myip $firewall $target $username $password $version);
use vars qw($pass $url $sock @result $result $code $domain);
use Getopt::Long;

GetOptions('u=s' => \$username, 'p=s' => \$password, 'ip=s' => \$myip, 'd=s' => \$domain);

usage() if !$username;
usage() if !$password;

# If you're behind a firewall or HTTP proxy, set this to 1.
# If you're not sure, set it to 1; that's the safer setting anyway.
# If you KNOW you're not behind a firewall or proxy, set to 0.
$firewall = 0;

# Originally written for hn.org by:
#
# (C)2000-2001 David E. Smith <dave@bureau42.com> and released to the 
#  public under the terms of the GNU General Public License.
#
# With credits given to:
#
# Modified by Daniel Hagan <dhagan@colltech.com> on 4/2001 to use IO::Socket,
# Syslog, and some error checking.  Now logs all output to daemon facility.
#
# Other changes made/suggested by Aurelien Beaujean <aure@dagobah.eu.org>
# Sorry, but I can't type the accent over the first "e" in Aurelien.
# 
# It was then hacked up to work with Everydns.net by Dave Fortunato 
# <davidf@everydns.net>

use MIME::Base64;
use IO::Socket;

if ($firewall && !$myip) { 
	die "Error: IP required as command line argument when \$firewall is set to true.";
}

$target = "dyn.everydns.net";
$version = "0.1";
$pass = MIME::Base64::encode_base64("$username:$password");

if ($firewall == 1 or $myip) {
	$url = "/index.php?ver=$version&ip=$myip" if !$domain;
	$url = "/index.php?ver=$version&ip=$myip&domain=$domain" if $domain;
} else {
	$url = "/index.php?ver=$version" if !$domain;
	$url = "/index.php?ver=$version&domain=$domain" if $domain;
}

$sock = new IO::Socket::INET(
	PeerAddr => "$target",
	PeerPort => 'http(80)'
);

if (!$sock) {
	print "Connect failed\n\n";
	exit(1);
}

$sock->autoflush(1);

$sock->print("GET $url HTTP/1.0\r\n");
$sock->print("User-Agent: eDNS.pl $version\r\n");
$sock->print("Host: $target\r\n");
$sock->print("Authorization: Basic $pass\r\n\r\n");

@result = $sock->getlines();

undef $sock; #Close the socket

$result = join '', @result;
#print $result; #uncomment for debugging information
$result =~ m/Exit Code: (\d+)/i;
$code = $1;

if ($code eq "0" and $myip) {
	print "Succeeded in setting domain to $myip.\n";
	exit(0);
} elsif ($code eq "0" and !$myip){
	print "Succeeded in setting domain to current ip address\n";
	exit(0);
} else {
	print "Received Exit Code $code, probably failed.\n";
	exit(1);
}

sub usage {
        print "Usage: eDNS.exe -u username -p password -ip IP_Address -d domain\n";
        print "Or   : eDNS.exe -u username -p password -d domain\n";
	print "Or   : eDNS.exe -u username -p password\n";
        exit(1);
}
