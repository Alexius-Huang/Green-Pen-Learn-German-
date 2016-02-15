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

puts "Complete!"

print "Seed file generating verb tenses content for the first verb..."

sample_present_tense = ["habe", "hast", "hat", "haben", "habt", "haben", "Irregular german verb."]
sample_past_tense = ["hatte", "hattest", "hatte", "hatten", "hattet", "hatten", "Irregular german verb."]
sample_perfect_tense = ["habe gehabt", "hast gehabt", "hat gehabt", "haben gehabt", "habt gehabt", "haben gehabt", "Irregular german verb."]
sample_verb = Verb.first

should_generate_present_tense_for_first_verb = sample_verb.presents.create(
	first_person: sample_present_tense[0],
	second_person: sample_present_tense[1],
	third_person: sample_present_tense[2],
	plural_first_person: sample_present_tense[3],
	plural_second_person: sample_present_tense[4],
	plural_third_person: sample_present_tense[5],
	description: sample_present_tense[6]	
)
should_generate_past_tense_for_first_verb = sample_verb.pasts.create(
	first_person: sample_past_tense[0],
	second_person: sample_past_tense[1],
	third_person: sample_past_tense[2],
	plural_first_person: sample_past_tense[3],
	plural_second_person: sample_past_tense[4],
	plural_third_person: sample_past_tense[5],
	description: sample_past_tense[6]	
)
should_generate_perfect_tense_for_first_verb = sample_verb.perfects.create(
	first_person: sample_perfect_tense[0],
	second_person: sample_perfect_tense[1],
	third_person: sample_perfect_tense[2],
	plural_first_person: sample_perfect_tense[3],
	plural_second_person: sample_perfect_tense[4],
	plural_third_person: sample_perfect_tense[5],
	description: sample_perfect_tense[6]	
)

puts "Complete!"
