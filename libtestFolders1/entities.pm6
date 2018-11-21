#new perl pm6 file
# 2017-09-24

#unit module Point2D;
#class professionalStatistics {
#    has $.myvar;
#}

class charEnt is export {

  has Str $.cedictEntry is rw;
  has Str $.charTrad is rw;
  has Str $.charSimp is rw;
  has Str $.charTradPron is rw;

  # The number of times the character apear in 171,882,493 character corpus.
  # eg. 的 = 1, 是 = 2, 不 = 3,
  # the tzai number pertains to the traditional character
  # http://technology.chtsai.org/charfreq/
  # http://technology.chtsai.org/charfreq/sorted.html
  has int $.tzaiNum is rw;
  has int $.tzaiStat is rw;
  has Rat $.tzaiFreq is rw;

  # the number of times the character apear in 193,504,018 character corpus
  #eg. 的 = 1, 一 = 2; 是 = 3;
  # the jun da number pertains to the simplified character;
  #http://lingua.mtsu.edu/chinese-computing/statistics/char/list.php?Which=MO
  has int $.jundaNum is rw;
  has int $.jundaStat is rw;
  has Rat $.jundaFreq is rw;

  has Str $.heisigTradName is rw;
  has int $.heisigTradNum is rw;
  has Str $.heisigTradStory is rw;

  method printContent() returns Str {
    my Str $output = "";
    $output = $output ~ " cedictEntry: " ~ $!cedictEntry ~ 15.chr;
    $output = $output ~ " charTrad: " ~ $!charTrad ~ 15.chr;
    $output = $output ~ " charSimp: " ~ $!charSimp ~ 15.chr;
    $output = $output ~ " charTradPron: " ~ $!charTradPron ~ 15.chr;

    $output = $output ~ " heisigTradName: " ~ $!heisigTradName ~ 15.chr;
    $output = $output ~ " heisigTradNum: " ~ $!heisigTradNum ~ 15.chr;
    $output = $output ~ " heisigTradStory: " ~ $!heisigTradStory ~ 15.chr;

    $output = $output ~ " tzaiNum: " ~ $!tzaiNum ~ 15.chr;
    $output = $output ~ " tzaiStat: " ~ $!tzaiStat ~ 15.chr;
    $output = $output ~ " tzaiFreq: " ~ $!tzaiFreq ~ 15.chr;

    $output = $output ~ " jundaNum: " ~ $!jundaNum ~ 15.chr;
    $output = $output ~ " jundaStat: " ~ $!jundaStat ~ 15.chr;
    $output = $output ~ " jundaFreq: " ~ $!jundaFreq ~ 15.chr;

    return $output;
  }


  class wordEnt is export {
    # a string og the characters in the word
    has Str $.word is rw;
    # a string of the relevant cedict line(s);
    has charEnt @.charEntList is rw;

    has Str $.wordPron is rw;
    has Str $.cedictEntry is rw;

      method printContent() returns Str {
        my Str $output = "";
        $output = $output ~ " cedictEntry: " ~ $!cedictEntry ~ 15.chr;
        $output = $output ~ " word: " ~ $!word ~ 15.chr;
        $output = $output ~ " wordPron: " ~ $!wordPron ~ 15.chr;
        return $output;
      }

    }


    class senEnt is export {
      # WholeSen includes punctuation;
      has Str $.firstLineInfo is rw;
      has Str $.sen is rw;
      has wordEnt @.wordEntList is rw;

      method printContent() returns Str {
        my Str $output = "";
        $output = $output ~ " firstLineInfo: " ~ $!firstLineInfo ~ 15.chr;
        $output = $output ~ " sen: " ~ $!sen ~ 15.chr;
        return $output;
      }
    }

class storyEnt is export {
  has Str $.firstLineInfo is rw;
  has senEnt @.senEntList is rw;
}




}


=begin comment

=end comment


=begin comment
=end comment

=begin comment

      method !paramError(Str $potentialContent, Str $charTrad) {
        if ($potentialContent.WHAT != Str ||
            $potentialContent.chars < 1 ||
            $potentialContent == " ") {
            return '(' ~ $charTrad ~ ')';
        } else {
            return $potentialContent;
        }
      }

    method new(Str $tradChar, @DataC2lpT2snJ2snH3nms) {
        #say try "some-filename.txt".IO.slurp // "sane default";
        my Str $cedictText = "";
        my Str $cedictSimpExtract = "";
        my Str $cedictPronExtract = "";
        try $cedictText = @DataC2lpT2snJ2snH3nms[0]{$tradChar} // "" ;
        try $cedictSimpExtract = $cedictText.substr(2,3) // "";
        try $cedictPronExtract = @DataC2lpT2snJ2snH3nms[1]{$tradChar} // "";

        charTrad => $tradChar;
        charSimp => self!paramError($cedictSimpExtract, $tradChar);
        charTradPron => self!paramError($cedictPronExtract, $tradChar);
        tzaiStat => self!paramError(@DataC2lpT2snJ2snH3nms[2]{$tradChar}, $tradChar);
        tzaiNumber => self!paramError(@DataC2lpT2snJ2snH3nms[3]{$tradChar}, $tradChar);
        jundaStat => self!paramError(@DataC2lpT2snJ2snH3nms[4]{$tradChar}, $tradChar);
        junDaNumber => self!paramError(@DataC2lpT2snJ2snH3nms[5]{$tradChar}, $tradChar);
        heisigTradNum => self!paramError(@DataC2lpT2snJ2snH3nms[6]{$tradChar}, $tradChar);
        heisigTradTrans => self!paramError(@DataC2lpT2snJ2snH3nms[7]{$tradChar}, $tradChar);
        cedictEntry => self!paramError($cedictText, $tradChar);
    }


=end comment
