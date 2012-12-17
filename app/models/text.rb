class Text < ActiveRecord::Base #framework aus verschiedenen klassen/module
  attr_accessible :input, :user_id, :publish_text, :color_scheme

  validate  :input_should_not_be_empty

  belongs_to :user
  
  COLORS = ['blue','red','green']

  def self.colors_blue
    { 'a' => '112233','b' => '223344','c' => '334455','d' => '445566','e' => '556677',
      'f' => '667788','g' => '778899','h' => '8899AA','i' => '99AABB','j' => 'AABBCC',
      'k' => 'BBCCDD','l' => 'CCDDEE','m' => 'DDEEFF','n' => 'EEFF11','o' => 'FF1122',
      'p' => '123456','q' => '234567','r' => '345678','s' => '456789','t' => '56789A',
      'u' => '6789AB','v' => '789ABC','w' => '89ABCD','x' => '9ABCDE','y' => 'ABCDEF',
      'z' => 'BCDEF1' }
  end

  def self.colors_red
    { 'a' => '320603','b' => '520905','c' => '520905','d' => '620b06','e' => '720d07',
      'f' => '820f08','g' => 'FFAE00','h' => '921109','i' => 'a2130a','j' => 'FFC340',
      'k' => 'b2150b','l' => 'c2160c','m' => 'd2180d','n' => 'e21a0e','o' => 'f01d11',
      'p' => 'f23c31','q' => 'f34b41','r' => 'FFCD00','s' => 'f45a51','t' => 'FFAE00',
      'u' => '720d07','v' => '520905','w' => '520905','x' => '520905','y' => '620b06',
      'z' => '320603' }
  end


  def self.colors_green
    { 'a' => '011303','b' => '022406','c' => '023409','d' => '04540f','e' => '03440c',
      'f' => '023409','g' => 'A8B456','h' => '04540f','i' => '056511','j' => '056511',
      'k' => 'A4B434','l' => '056511','m' => '056511','n' => '057514','o' => '057514',
      'p' => '068517','q' => '07951a','r' => '07a51d','s' => '08b61f','t' => '09c622',
      'u' => '0ad625','v' => '0ef42d','w' => '068517','x' => '07a51d','y' => '023409',
      'z' => '056511' }
  end

  def picture
    Picture.new(input)
  end
  
  def input_should_not_be_empty
    if picture.normalized_string.blank?
      errors.add(:input, "You should write something!")
    end
  end

  def squares
    picture.squares
  end
  
  def rows
    picture.rows
  end

end