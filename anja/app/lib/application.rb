class Application
  attr_reader :entry
  
  def self.colors
    {   "a" => "cccccc","b" => "666666","c" => "999999","d" =>"ffffff","e" => "eeeeee","f" => "3344ee",
        "g" => "cc4455","h" => "33ff44","i" => "556688","j" => "ccddee","k" => "444444","l" => "ff4455",
        "m" => "778899","n" => "112233","o" => "445566","p" => "222222","q" => "6677ff","r" => "556677",
        "s" => "445566","t" => "443322","u" => "556677","v" => "227788","w" => "3344ff","x" => "334455",
        "y" => "445566","z" => "277882"}
  end

  def initialize(entry)
    @entry = entry
  end

  def picture
    Picture.new(@entry,"rows","columns")
  end

  def squares
    picture.squares
  end

  def rows
    @entry / 2 = @rows
  end

  def columns
    @entry / 2 = @columns
  end


end
