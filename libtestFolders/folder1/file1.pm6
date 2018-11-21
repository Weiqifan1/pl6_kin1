use folder2::file2;

class folder1::file1 is export {
  has Str $.mystr = "file 1";

  submethod TWEAK() {
    $!mystr ~= "\n" ~ folder2::file2.new.mystr;
  }
}