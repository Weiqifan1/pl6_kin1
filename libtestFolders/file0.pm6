use folder1::file1;

class file0 is export {
  has Str $.mystr = "file 0";

  submethod TWEAK() {
    say "hello file 0";
    $!mystr ~= "\n" ~ folder1::file1.new.mystr; 
  }
}
#   2018-11-14: for at køre file0 i main.py:
#use lib 'lib';
#use file0;
#my $file0 = file0.new;
#say $file0.mystr;
#say 'end';



