#!/usr/bin/perl -w
use strict;
use warnings;
use POSIX qw(setsid);
use perlBin::DB;

main(@ARGV);

sub main{
	chdir '/home/pablo/RailsApps/3.1.0/prayergalaxy/' or die "Can't chdir to dir: $!";
	#chdir '/home/vrmedia/PrayerGalaxy/' or die "Can't chdir to dir: $!";
	umask 0;
	#open STDIN, '/dev/null'   or die "Can't read /dev/null: $!";
	#open STDOUT, '>/dev/null' or die "Can't write to /dev/null: $!";
	#open STDERR, '>/dev/null' or die "Can't write to /dev/null: $!";
	my $pid = fork();
	exit if $pid;
	setsid or die "Can't start a new session: $!";
	
	my $db = DB->new();
	my $true = 1;
	my $id = 0;
	my $video = "";
		
	while($true){
		print "check";
		my $query = $db->query("SELECT id,video FROM videos WHERE status=0");
		createThumbs($id, $video) while ($id, $video)=$query->fetchrow_array();
		sleep(30);
	}
}

sub createThumbs{
	my ($id, $video) = @_;
	print "I've found a new video!";
	system("./createVideoPics.sh '$video' &");

	my $db = DB->new();
	my $query = $db->do("UPDATE videos SET status=1 WHERE id=$id");	
}
