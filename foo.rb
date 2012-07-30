class User
  def initialize(name)
    @name = name
  end

  def introduce
    puts 'Hi! My name is ' + @name
  end

  def send_email(recipient, subject, body)
    email = Email.new(recipient, subject, body, @name)
    email.send
  end
end

class Email
  def initialize(recipient, subject, body, sender)
    @recipient = recipient
    @subject = subject
    @body = body
    @sender = sender
  end

  def send
    puts %(sending an email from #{@sender} to #{@recipient} with the subject "#{@subject}" and the body "#{@body}")
  end
end

anja = User.new('Anja')
sabrina = User.new('Sabrina')

anja.introduce
sabrina.introduce

anja.send_email('carla@email.com', 'Railsgirls infos!', 'Lots of text here ...')
