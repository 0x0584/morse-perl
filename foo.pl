my @arr = split //, "this is a test";
print "@arr";

my $a;
for (@arr) {
    $a .= $_, last if $_ eq 'a';
}

print "\ncool $a\n";
