
#use lib '.';

sub chr5 is export {
    my ($x) = @_;
    #say $x;
    
    #my $contents = "cedict_minitest".IO.slurp;
    #say $contents;
    return $x;
};

if "setupFolder/cedict_minitest.txt".IO.e {
    say "file exists";
}
else {
    say "file doesn't exist";
}


#end