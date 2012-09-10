class Application
  # ... knows all the available colors (this is common class knowledge, so it should be a class method)
  def self.colors
    { 'a' => '112233',
      'b' => '223344',
      'c' => '334455',
      'd' => '445566',
      'e' => '556677',
      'f' => '667788',
      'g' => '778899',
      'h' => '8899AA',
      'i' => '99AABB',
      'j' => 'AABBCC',
      'k' => 'BBCCDD',
      'l' => 'CCDDEE',
      'm' => 'DDEEFF',
      'n' => 'EEFF11',
      'o' => 'FF1122',
      'p' => '123456',
      'q' => '234567',
      'r' => '345678',
      's' => '456789',
      't' => '56789A',
      'u' => '6789AB',
      'v' => '789ABC',
      'w' => '89ABCD',
      'x' => '9ABCDE',
      'y' => 'ABCDEF',
      'z' => 'BCDEF1' }
  end

  def initialize(string)
    @string = string
  end

  # ... has a method `picture` which returns an instance of `Picture` created with that string
  def picture
    Picture.new(@string)
  end

  # ... has a method `squares` which returns the squares from the picture
  def squares
    picture.squares
  end
end


