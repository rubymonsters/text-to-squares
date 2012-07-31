class User
  def initialize(name)
    @name = name
  end

  def name
    @name
  end

  def introduce
    puts 'Hi! My name is ' + @name
  end

  def send_email(recipient, subject, body = 'Default text', options = {})
    options[:sender] = @name
    email = Email.new(recipient, subject, body, options)
    email.send
  end
end

class Email
  def initialize(recipient, subject, body, options = {})
    # options[:sender] = options[:sender] || 'unknown sender'
    options[:sender] ||= 'unknown sender'

    @recipient = recipient
    @subject = subject
    @body = body
    @options = options
  end

  def send
    puts %(sending an email from #{@options[:sender]} to #{@recipient} with the subject "#{@subject}" and the body "#{@body}")
  end
end

anja = User.new('Anja')
sabrina = User.new('Sabrina')

anja.introduce
sabrina.introduce

puts anja.name

anja.send_email('carla@email.com', 'Railsgirls infos!')


def juggle_with(*things)
  p things
end

juggle_with(1)
juggle_with(1, :foo)
juggle_with(1, anja.name, User.new('Bettina'), Email.new('carla@email.com', 'Yay, juggling an email!', 'Some text'))
juggle_with(1, 2, 3, 4)
