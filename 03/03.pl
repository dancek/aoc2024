while(<>) { chomp; $in.=$_ }

sub mulsum { my ($s)=@_, $sum=0;
    while($_[0] =~ /mul\((\d+),(\d+)\)/g) {
        $sum += $1*$2 }
    $sum }

print mulsum($in)."\n";
$in =~ s/don't\(\).*?(do\(\)|$)//g;
print mulsum($in)
