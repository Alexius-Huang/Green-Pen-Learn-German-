puts "This is the seed file for RAILS application for : green_pen"
puts "Seed file processing..."

print "Seed file generating 10 users..."

sample_password = "1234567890"
sample_email_prefix = ""
sample_username = ["Max", "Anita", "Mike", "Martin", "Danial", "Sam", "Christina", "Gary", "Ken", "John"]

should_generate_10_users = (1..10).each do |number|
	sample_email_prefix += number.to_s
	sample_email = sample_email_prefix + "@" + sample_email_prefix + ".com"
	
	if (1..3).include? number
		admin = true
	else
		admin = false
	end
	
	User.create(
		username: sample_username[number - 1],
		email: sample_email,
		password: sample_password,
		password_confirmation: sample_password,
		administrator: admin
	)
end

puts "Complete!"
