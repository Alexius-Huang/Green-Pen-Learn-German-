puts "This is the seed file for RAILS application for : green_pen"
puts "Seed file processing..."

print "Seed file generating 10 users with 3 admins..."

sample_password = "1234567890"
sample_email_prefix = ""
sample_username = ["Max", "Anita", "Mike", "Martin", "Danial", "Sam", "Christina", "Gary", "Ken", "John"]

should_generate_10_users_with_3_admins = (1..10).each do |number|
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

print "Seed file generating 5 german verbs..."

sample_german_verbs = ["haben", "heißen", "antworten", "gehen", "sehen"]
sample_verb_description = ["have", "called", "answer", "go to/ come to", "see"]

should_generate_5_german_verbs = (0..4).each do |number|
	Verb.create(title: sample_german_verbs[number], description: sample_verb_description[number])
end

print "Complete!"

















