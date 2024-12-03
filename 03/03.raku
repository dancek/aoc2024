my $in=$*IN.slurp();
sub solve{ say [+] ($in ~~ m:g/mul\((\d+)\,(\d+)\)/)>>.&{$_[0]*$_[1]} };
solve;
$in ~~ s:g/don\'t\(\).*?(do\(\)|$)//; solve;
