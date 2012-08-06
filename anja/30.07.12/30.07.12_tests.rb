class User
	def initialize(name)
		@name = name
	end

	def introduce
		puts 'Hi my name is ' + @name
	end

		def send_email(recipient, subject, body)
		puts "sending an email to \"#{recipient}\" "  									#interpolation
		puts %(sending an email to "#{recipient}") 
		puts "sending an email to " + recipient
	end
end


anja = User.new('Anja')
anja.introduce
anja.send_email('carla@email.com', 'Railsgirls info!', 'Lots of text here ...')


juri = User.new('Juri')
juri.introduce

puts User.name