class User
  def initialize(name)
    @name = name
  end

  def introduce
    puts 'Hi! My name is ' + @name
  end

  def send_email(recipient, subject, body)
    puts "sending an email to #{recipient} with the subject #{subject} and the text #{body}"
  end
end

anja = User.new('Anja')
anja.introduce
anja.send_email('carla@email.com', 'Railsgirls infos!', 'Lots of text here ...')
