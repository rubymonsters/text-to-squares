
class User
	def initialize(name)    
		@name = name
	end

	def introduce
		puts 'Hi my name is ' + @name
	end

	def send_email(recipient, subject, body = 'Default value', options = {})
		options[:sender] = @name
		email = Email.new(recipient, subject, body, obtions)
		email.send
	end
end

class Email
	def initialize(recipient, subject, body, options = {})
		@recipient = recipient
		@subject = subject
		@body = body
		@options = options
	end

	def send
		puts %(sending email from "#{@options[:sender]}" to "#{@recipient}" with the subject "#{@subject}" and the "#{@body}")
		end
end

anja = User.new('Anja')
anja.introduce
anja.send_email('carla@email.com', 'Railsgirls info!')
