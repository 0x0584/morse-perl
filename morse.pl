#!/usr/bin/perl
#===============================================================================
#
#         FILE: morse.pl
#
#        USAGE: ./morse.pl
#
#  DESCRIPTION: ---
#
#      OPTIONS: ---
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Anas Rchid (0x0584) <rchid.anas@gmail.com>
# ORGANIZATION: ---
#      VERSION: 1.0
#      CREATED: 01/27/2018
#     REVISION: ---
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

print decode encode "anas rchid";
