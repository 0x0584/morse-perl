#!/usr/bin/perl
#===============================================================================
#
#         FILE: morse.pl
#
#        USAGE: ./morse.pl
#
#  DESCRIPTION: this was my final project when i was at ISTA, so i have a some
#		sort of mermories when i hear `morse code`, good memories
#		indeed.
#		so i was bored while i was thinking: "why no re-implement morse
#		project using perl?".
#
#		the result was shoking, in less than 40 i re-create a project
#		toke me more than 50 days of work! i'm not sure is it Perl that
#		makes stuff fucking easy or is it me who have become a better
#		programmer? who knows..
#
#         BUGS: ---
#       AUTHOR: Anas Rchid (0x0584) <rchid.anas@gmail.com>
#      VERSION: 1.0
#      CREATED: 01/27/2018
#===============================================================================

use strict;
use warnings;
use diagnostics;

our %tree = (
    # Alpha
    "A" => ".-", "B" => "-...", "C" => "-.-.", "D" => "-..",
    "E" => ".", "F" => "..-.", "G" => "--.", "H" => "....",
    "I" => "..", "J" => ".---", "K" => "-.-", "L" => ".-..",
    "M" => "--", "N" => "-.", "O" => "---", "P" => ".--.",
    "Q" => "--.-", "R" => ".-.", "S" => "...", "T" => "-",
    "U" => "..-", "V" => "...-", "W" => ".--", "X" => "-..-",
    "Y" => "-.--", "Z" => "--..",

    # Punctuation
    "=" => "-...-", "?" => "..--..", "/" => "-..-.", "," => "--..--",
    "." => ".-.-.-", ":" => "---...", "'" => ".----.", "-" => "-....-",
    "" => "-.--.-", "," => "-.--.-",

    # Numbers
    "0" => "-----", "1" => ".----", "2" => "..---", "3" => "...--",
    "4" => "....-", "5" => ".....", "6" => "-....", "7" => "--...",
    "8" => "---..", "9" => "----.",

    # RECENTLY STANDARDIZED
    "@" => ".--.-."
);

sub encode {
    my $str;

    for (split ' ', $_[0]) {
	$str .= $tree{uc $_}." " for split //, $_;
	$str .= " / ";
    }

    return $str;
}

sub decode {
    my $str;

    for (split '/', $_[0]) {
	for my $mo_w (split ' ', $_) {
	    for (keys %tree) {
		$str .= $_, last if $tree{$_} eq $mo_w;
	    }
	}

	$str .= ' ';
    }

    return $str;
}

my $lines = "";
chomp ($lines .= $_) while <STDIN>;

for (65..90) {
    printf "%c - ", $_;
    print split '/', encode sprintf "%c", "$_";
    print $_ % 2 ? "\t" : "\n";
}

print "\n\t-------\n";
print decode $lines;
print "\n";
print encode $lines;
print "\n";
