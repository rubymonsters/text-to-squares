
class User
	def initialize(name)    
		@name = name
	end

	def introduce
		puts 'Hi my name is ' + @name
	end

	def send_email(recipient, subject, body = 'Default value', options = {}) #? hier hash initialisiert, warum bei bei class Email nochmal?
		options[:sender] = @name
		email = Email.new(recipient, subject, body, options)
		email.send
	end
end

class Email
	def initialize(recipient, subject, body, options = {})
		options[:sender] ||='unknown sender'  #falls kein sender da ist schreibe unknow..
		@recipient = recipient
		@subject = subject
		@body = body
		@options = options
	end

	def send
		sender = @options[:sender] || 'unknown sender'   # || or
		puts %(sending email from "#{sender}" to "#{@recipient}" with the subject "#{@subject}" and the "#{@body}")
		end
end

anja = User.new('Anja')
anja.introduce
anja.send_email('carla@email.com', 'Railsgirls info!')
