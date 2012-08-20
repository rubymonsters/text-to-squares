class Foos
  def something
    puts 'Hi!'
  end
end

Foos.new.something

# Inharitance

class Animal
  def sound
    'sound'
  end
end

class Dog < Animal
  def sound         # überschreibt die Methode der parent-class
    'wuff wuff'
  end
end

puts Dog.new.sound  # ohne 'sound' wird die Adresse ausgegeben

# object has a state

class Foo
  def bar
    @something      # Instanzvariable
    a = 1
  end
end

#a = 1               # local variable

puts Foo.new.bar

class User
  def initialize(name)
    @name = name
  end
  
  def name
    @name
  end
  
  def introduce
    puts 'Hi, my name is ' + @name
  end
  
  def send_email(recipient, subject, body='Default text', options={}) # wenn keine Angabe wird default übergeben
    #puts "sending email to #{recipient} with the subject #{subject} and the text #{body}"
    #puts %(sending email to #{recipient} with the subject "#{subject}" and the text #{body}")
    options[:sender] = @name
    email = Email.new(recipient, subject, body, options)
    email.send
  end
end

class Email
  def initialize(recipient, subject, body, options={})
    options[:sender] ||= 'unknown sender'
    @recipient = recipient            # instance variable - belongs to the instance of the object
    @subject = subject
    @body = body
    @options = options                  # replace options
  end
  
  def send    # @options[:sender]
#    sender = @options[:sender] or 'unknown sender'
#    unless sender
#      sender ='unknown sender'
#    end
    puts %(sending email from #{@options[:sender]} to #{@recipient} with the subject "#{@subject}" and the text "#{@body}")
  end
end

# Hash
options = {
  :name => 'Sven',
  :email => 'me@svenfuchs.de',
  :twitter => '@svenfuchs'
}

sabrina = User.new('Sabrina')
anja = User.new('Anja')
anja.introduce
anja.send_email('carla@gmail.com', 'Railsgirls infos', 'lots of text')
#sabrina.introduce

# parameter and arguments are the same thing from different perspective
# parameter in funktionsaufruf
# argument in funktionsdefinition

# def juggle_with(thing_1, thing_2, thing_3)
def juggle_with(*things)    # splash ?
  p things                  # p im Unterschied zu puts
end

juggle_with(1)
juggle_with(2)
juggle_with(1, 2, 3)
juggle_with(1, :foo, User.new('Bettina'), anja, sabrina.name)
