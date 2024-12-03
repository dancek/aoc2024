while(<>) { chomp; $in.=$_ }
sub mulsum { my $sum=0;
    while($_[0] =~ /mul\((\d+),(\d+)\)/g) {
        $sum += $1*$2 } $sum }

print mulsum($in)."\n";
print mulsum($in =~ s/don't\(\).*?(do\(\)|$)//gr)."\n";
